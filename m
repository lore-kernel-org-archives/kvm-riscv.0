From: Anup Patel <apatel@ventanamicro.com>
Date: Wed,  8 Jun 2022 22:43:34 +0530
Subject: [PATCH] rpmsg: virtio: Fix broken rpmsg_probe()
Message-ID: <20220608171334.730739-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The rpmsg_probe() is broken at the moment because virtqueue_add_inbuf()
fails due to both virtqueues (Rx and Tx) marked as broken by the
__vring_new_virtqueue() function. To solve this, virtio_device_ready()
(which unbreaks queues) should be called before virtqueue_add_inbuf().

Fixes: 8b4ec69d7e09 ("virtio: harden vring IRQ")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 905ac7910c98..71a64d2c7644 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -929,6 +929,9 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	/* and half is dedicated for TX */
 	vrp->sbufs = bufs_va + total_buf_space / 2;
 
+	/* From this point on, we can notify and get callbacks. */
+	virtio_device_ready(vdev);
+
 	/* set up the receive buffers */
 	for (i = 0; i < vrp->num_bufs / 2; i++) {
 		struct scatterlist sg;
@@ -983,9 +986,6 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	 */
 	notify = virtqueue_kick_prepare(vrp->rvq);
 
-	/* From this point on, we can notify and get callbacks. */
-	virtio_device_ready(vdev);
-
 	/* tell the remote processor it can start sending messages */
 	/*
 	 * this might be concurrent with callbacks, but we are only
-- 
2.34.1


