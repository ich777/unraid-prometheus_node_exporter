 # Clone repository and compile Node Exporter
cd ${DATA_DIR}
git clone https://github.com/prometheus/node_exporter
cd ${DATA_DIR}/node_exporter
git checkout v$LAT_V
make -j${CPU_COUNT}

# Create directories and copy files to destination
mkdir -p ${DATA_DIR}/v${LAT_V} ${DATA_DIR}/${LAT_V}/usr/bin ${DATA_DIR}/${LAT_V}/usr/local/emhttp/plugins/prometheus_node_exporter/images
cp ${DATA_DIR}/node_exporter/node_exporter ${DATA_DIR}/$LAT_V/usr/bin/prometheus_node_exporter

# Download icon to destination
wget -q -O ${DATA_DIR}/${LAT_V}/usr/local/emhttp/plugins/prometheus_node_exporter/images/prometheus_node_exporter.png https://raw.githubusercontent.com/ich777/docker-templates/master/ich777/images/prometheus.png
cd ${DATA_DIR}/${LAT_V}
chmod -R 755 ${DATA_DIR}/$LAT_V/

# Create Slackware package
makepkg -l y -c y ${DATA_DIR}/v$LAT_V/$APP_NAME-"$(date +'%Y.%m.%d')".tgz
cd ${DATA_DIR}/v$LAT_V
md5sum $APP_NAME-"$(date +'%Y.%m.%d')".tgz | awk '{print $1}' > $APP_NAME-"$(date +'%Y.%m.%d')".tgz.md5