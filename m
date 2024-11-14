From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 14 Nov 2024 17:18:52 +0100
Subject: [RFC PATCH 07/15] iommu/riscv: Move definitions to iommu.h
In-Reply-To: <20241114161845.502027-17-ajones@ventanamicro.com>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
Message-ID: <20241114161845.502027-24-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In order to add the interrupt remapping support in a separate file,
share definitions through the header, as well as making some
functions public.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu-bits.h |  4 ++
 drivers/iommu/riscv/iommu.c      | 71 ++++----------------------------
 drivers/iommu/riscv/iommu.h      | 54 ++++++++++++++++++++++++
 3 files changed, 67 insertions(+), 62 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index d72b982cf9bf..d3d98dbed709 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -36,6 +36,10 @@
 #define RISCV_IOMMU_ATP_PPN_FIELD	GENMASK_ULL(43, 0)
 #define RISCV_IOMMU_ATP_MODE_FIELD	GENMASK_ULL(63, 60)
 
+/* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
+#define riscv_iommu_phys_to_ppn(pa)	(((pa) >> 2) & (((1ULL << 44) - 1) << 10))
+#define riscv_iommu_ppn_to_phys(pn)	(((pn) << 2) & (((1ULL << 44) - 1) << 12))
+
 /* 5.3 IOMMU Capabilities (64bits) */
 #define RISCV_IOMMU_REG_CAPABILITIES		0x0000
 #define RISCV_IOMMU_CAPABILITIES_VERSION	GENMASK_ULL(7, 0)
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index ef38a1bb3eca..6e8ea3d22ff5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -24,23 +24,10 @@
 #include "iommu-bits.h"
 #include "iommu.h"
 
-/* Timeouts in [us] */
-#define RISCV_IOMMU_QCSR_TIMEOUT	150000
-#define RISCV_IOMMU_QUEUE_TIMEOUT	150000
-#define RISCV_IOMMU_DDTP_TIMEOUT	10000000
-#define RISCV_IOMMU_IOTINVAL_TIMEOUT	90000000
-
 /* Number of entries per CMD/FLT queue, should be <= INT_MAX */
 #define RISCV_IOMMU_DEF_CQ_COUNT	8192
 #define RISCV_IOMMU_DEF_FQ_COUNT	4096
 
-/* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
-#define phys_to_ppn(pa)  (((pa) >> 2) & (((1ULL << 44) - 1) << 10))
-#define ppn_to_phys(pn)	 (((pn) << 2) & (((1ULL << 44) - 1) << 12))
-
-#define dev_to_iommu(dev) \
-	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
-
 /* IOMMU PSCID allocation namespace. */
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
@@ -177,7 +164,7 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
 	if (!queue->base)
 		return -ENOMEM;
 
-	qb = phys_to_ppn(queue->phys) |
+	qb = riscv_iommu_phys_to_ppn(queue->phys) |
 	     FIELD_PREP(RISCV_IOMMU_QUEUE_LOG2SZ_FIELD, logsz);
 
 	/* Update base register and read back to verify hw accepted our write */
@@ -480,15 +467,15 @@ static irqreturn_t riscv_iommu_cmdq_process(int irq, void *data)
 }
 
 /* Send command to the IOMMU command queue */
-static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
-				 struct riscv_iommu_command *cmd)
+void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
+			  struct riscv_iommu_command *cmd)
 {
 	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd));
 }
 
 /* Send IOFENCE.C command and wait for all scheduled commands to complete. */
-static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
-				 unsigned int timeout_us)
+void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
+			  unsigned int timeout_us)
 {
 	struct riscv_iommu_command cmd;
 	unsigned int prod;
@@ -614,7 +601,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
 		do {
 			ddt = READ_ONCE(*(unsigned long *)ddtp);
 			if (ddt & RISCV_IOMMU_DDTE_V) {
-				ddtp = __va(ppn_to_phys(ddt));
+				ddtp = __va(riscv_iommu_ppn_to_phys(ddt));
 				break;
 			}
 
@@ -622,7 +609,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
 			if (!ptr)
 				return NULL;
 
-			new = phys_to_ppn(__pa(ptr)) | RISCV_IOMMU_DDTE_V;
+			new = riscv_iommu_phys_to_ppn(__pa(ptr)) | RISCV_IOMMU_DDTE_V;
 			old = cmpxchg_relaxed((unsigned long *)ddtp, ddt, new);
 
 			if (old == ddt) {
@@ -687,7 +674,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
 		if (ddtp & RISCV_IOMMU_DDTP_BUSY)
 			return -EBUSY;
 
-		iommu->ddt_phys = ppn_to_phys(ddtp);
+		iommu->ddt_phys = riscv_iommu_ppn_to_phys(ddtp);
 		if (iommu->ddt_phys)
 			iommu->ddt_root = devm_ioremap(iommu->dev,
 						       iommu->ddt_phys, PAGE_SIZE);
@@ -734,7 +721,7 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	do {
 		rq_ddtp = FIELD_PREP(RISCV_IOMMU_DDTP_IOMMU_MODE, rq_mode);
 		if (rq_mode > RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
-			rq_ddtp |= phys_to_ppn(iommu->ddt_phys);
+			rq_ddtp |= riscv_iommu_phys_to_ppn(iommu->ddt_phys);
 
 		riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP, rq_ddtp);
 		ddtp = riscv_iommu_read_ddtp(iommu);
@@ -799,49 +786,9 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	return 0;
 }
 
-/* This struct contains protection domain specific IOMMU driver data. */
-struct riscv_iommu_domain {
-	struct iommu_domain domain;
-	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
-	int pscid;
-	int gscid;
-	bool amo_enabled;
-	int numa_node;
-	unsigned int pgd_mode;
-	unsigned long *pgd_root;
-};
-
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
-/* Private IOMMU data for managed devices, dev_iommu_priv_* */
-struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
-};
-
-/*
- * Linkage between an iommu_domain and attached devices.
- *
- * Protection domain requiring IOATC and DevATC translation cache invalidations,
- * should be linked to attached devices using a riscv_iommu_bond structure.
- * Devices should be linked to the domain before first use and unlinked after
- * the translations from the referenced protection domain can no longer be used.
- * Blocking and identity domains are not tracked here, as the IOMMU hardware
- * does not cache negative and/or identity (BARE mode) translations, and DevATC
- * is disabled for those protection domains.
- *
- * The device pointer and IOMMU data remain stable in the bond struct after
- * _probe_device() where it's attached to the managed IOMMU, up to the
- * completion of the _release_device() call. The release of the bond structure
- * is synchronized with the device release.
- */
-struct riscv_iommu_bond {
-	struct list_head list;
-	struct rcu_head rcu;
-	struct device *dev;
-};
-
 static int riscv_iommu_bond_link(struct riscv_iommu_domain *domain,
 				 struct device *dev)
 {
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index b1c4664542b4..dd538b19fbb7 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -17,8 +17,35 @@
 
 #include "iommu-bits.h"
 
+/* Timeouts in [us] */
+#define RISCV_IOMMU_QCSR_TIMEOUT	150000
+#define RISCV_IOMMU_QUEUE_TIMEOUT	150000
+#define RISCV_IOMMU_DDTP_TIMEOUT	10000000
+#define RISCV_IOMMU_IOTINVAL_TIMEOUT	90000000
+
+/* This struct contains protection domain specific IOMMU driver data. */
+struct riscv_iommu_domain {
+	struct iommu_domain domain;
+	struct list_head bonds;
+	spinlock_t lock;			/* protect bonds list updates. */
+	int pscid;
+	int gscid;
+	int amo_enabled;
+	int numa_node;
+	unsigned int pgd_mode;
+	unsigned long *pgd_root;
+};
+
+/* Private IOMMU data for managed devices, dev_iommu_priv_* */
+struct riscv_iommu_info {
+	struct riscv_iommu_domain *domain;
+};
+
 struct riscv_iommu_device;
 
+#define dev_to_iommu(dev) \
+	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
+
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
 	atomic_t head;				/* unbounded shadow ring buffer consumer index */
@@ -62,9 +89,36 @@ struct riscv_iommu_device {
 	u64 *ddt_root;
 };
 
+/*
+ * Linkage between an iommu_domain and attached devices.
+ *
+ * Protection domain requiring IOATC and DevATC translation cache invalidations,
+ * should be linked to attached devices using a riscv_iommu_bond structure.
+ * Devices should be linked to the domain before first use and unlinked after
+ * the translations from the referenced protection domain can no longer be used.
+ * Blocking and identity domains are not tracked here, as the IOMMU hardware
+ * does not cache negative and/or identity (BARE mode) translations, and DevATC
+ * is disabled for those protection domains.
+ *
+ * The device pointer and IOMMU data remain stable in the bond struct after
+ * _probe_device() where it's attached to the managed IOMMU, up to the
+ * completion of the _release_device() call. The release of the bond structure
+ * is synchronized with the device release.
+ */
+struct riscv_iommu_bond {
+	struct list_head list;
+	struct rcu_head rcu;
+	struct device *dev;
+};
+
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
 void riscv_iommu_remove(struct riscv_iommu_device *iommu);
 
+void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
+			  struct riscv_iommu_command *cmd);
+void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
+			  unsigned int timeout_us);
+
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
-- 
2.47.0


