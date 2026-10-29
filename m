Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBB4606A323
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ayKoh1pc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0RLvnz/SWNWalWs8/+ZJ74dKVnUE8UNz62eOnU9fypc=; b=ayKoh1pcVCywo5foRsIptNeOPb
	QS0uzvzW1KnQWAO0No+cj4FHlkVr3HPjp75NwfzsybNkL0929x8/CKO6RzGwcmcniNezTOkGiuUv2
	SnW/xbuVYSLh9JEwGYFMmSCpWR7ypVcfTXBGbEI1iHZtKWvjCbi98LD5hmhE8vgPI5jKrSGMe1GNp
	NnoDdN6Fpi+nwTh7VSdQVqxXIdV7g+5Cx+Yhhx41+TLybNVNr5SaCaS3eJc4LkqqwSd7BNQSMnJeA
	Jz6Koxz1p4eIa1n8KkvZ95lsVt2y7UdqqT7mH12tWHdZjUvizj5k+Z1dANH0q5d72igtu5nK+7wQA
	VwBYwayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJN3-00000008RlC-3SIg;
	Thu, 29 Oct 2026 06:12:17 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJMg-00000008RM2-1CIe;
	Thu, 29 Oct 2026 06:11:57 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jFYld3LqWz55RJ2;
	Thu, 29 Oct 2026 14:11:41 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 69T6BaVg044491;
	Thu, 29 Oct 2026 14:11:36 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 29 Oct 2026 14:11:38 +0800
X-Zmail-TransId: 3e816ae2e399027-e7d37
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517025@gmail.com>
Subject: [RFC PATCH v2 6/9] iommu/riscv: Add vIOMMU cache invalidation
Date: Thu, 29 Oct 2026 14:11:28 +0800
Message-ID: <20261029061131.584453-7-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029061131.584453-1-gong.shuai@sanechips.com.cn>
References: <20261029061131.584453-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 69T6BaVg044491
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 29 Oct 2026 14:11:41 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE2E39D.000/4jFYld3LqWz55RJ2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_231154_710033_ADB18D77 
X-CRM114-Status: GOOD (  18.11  )
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Guest page table updates require IOTINVAL.VMA commands to invalidate
cached stage 1 translations in the physical IOMMU. Allow user space
to pass these commands through the vIOMMU.

Do not forward guest commands unchanged. Validate them and replace
the guest isolation operands with host-assigned values so a guest
cannot invalidate cached translations belonging to another guest.

Co-developed-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu-bits.h | 13 +++++
 drivers/iommu/riscv/iommu.c      | 93 ++++++++++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
index 80c32f00ee5e..2f32330fcd16 100644
--- a/drivers/iommu/riscv/iommu-bits.h
+++ b/drivers/iommu/riscv/iommu-bits.h
@@ -486,6 +486,19 @@ struct riscv_iommu_command {
 /* dword1[61:10] is the 4K-aligned page address */
 #define RISCV_IOMMU_CMD1_IOTINVAL_ADDR		GENMASK_ULL(61, 10)
 
+/*
+ * All standard bits of the IOTINVAL command. The remaining bits are
+ * reserved for future standard use, forwarding them to the physical IOMMU
+ * may make it treat the command as illegal.
+ */
+#define RISCV_IOMMU_CMD0_IOTINVAL_STANDARD \
+	(RISCV_IOMMU_CMD0_OPCODE | RISCV_IOMMU_CMD0_FUNC | \
+	 RISCV_IOMMU_CMD0_IOTINVAL_AV | RISCV_IOMMU_CMD0_IOTINVAL_PSCID | \
+	 RISCV_IOMMU_CMD0_IOTINVAL_PSCV | RISCV_IOMMU_CMD0_IOTINVAL_GV | \
+	 RISCV_IOMMU_CMD0_IOTINVAL_NL | RISCV_IOMMU_CMD0_IOTINVAL_GSCID)
+#define RISCV_IOMMU_CMD1_IOTINVAL_STANDARD \
+	(RISCV_IOMMU_CMD1_IOTINVAL_S | RISCV_IOMMU_CMD1_IOTINVAL_ADDR)
+
 /* 3.1.2 IOMMU Command Queue Fences */
 /* Fields on dword0 */
 #define RISCV_IOMMU_CMD_IOFENCE_OPCODE		2
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 371d60902eaa..6bcf214016c3 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1812,8 +1812,101 @@ riscv_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
 	return &nested_domain->domain;
 }
 
+/*
+ * One invalidation command, viewed as either the little-endian uAPI
+ * payload or the native command words.
+ */
+struct riscv_viommu_invalidation_cmd {
+	union {
+		struct riscv_iommu_command cmd;
+		struct iommu_viommu_riscv_invalidate ucmd;
+	};
+};
+
+static int riscv_viommu_cache_invalidate(struct iommufd_viommu *viommu,
+					 struct iommu_user_data_array *array)
+{
+	struct riscv_viommu *rv_viommu = container_of(viommu, struct riscv_viommu, core);
+	struct riscv_iommu_device *iommu = rv_viommu->iommu;
+	struct riscv_viommu_invalidation_cmd *cmds;
+	unsigned int i = 0;
+	int ret;
+
+	if (array->type != IOMMU_VIOMMU_INVALIDATE_DATA_RISCV)
+		return -EINVAL;
+
+	/* entry_num==0 is the data_type support probe */
+	if (!array->entry_num)
+		return 0;
+
+	static_assert(sizeof(*cmds) == 2 * sizeof(u64));
+
+	cmds = kcalloc(array->entry_num, sizeof(*cmds), GFP_KERNEL);
+	if (!cmds)
+		return -ENOMEM;
+
+	ret = iommu_copy_struct_from_full_user_array(cmds, sizeof(*cmds), array,
+						     IOMMU_VIOMMU_INVALIDATE_DATA_RISCV);
+	if (ret)
+		goto out_free;
+
+	for (i = 0; i < array->entry_num; i++) {
+		struct riscv_iommu_command *cmd = &cmds[i].cmd;
+		u64 opcode, func;
+
+		/* The uAPI payload is little-endian */
+		cmd->dword0 = le64_to_cpu(cmds[i].ucmd.cmd[0]);
+		cmd->dword1 = le64_to_cpu(cmds[i].ucmd.cmd[1]);
+
+		opcode = FIELD_GET(RISCV_IOMMU_CMD0_OPCODE, cmd->dword0);
+		if (opcode != RISCV_IOMMU_CMD_IOTINVAL_OPCODE) {
+			/* Only page-table cache invalidation is forwarded */
+			ret = -EIO;
+			goto out_free;
+		}
+
+		/* Reject reserved bits instead of forwarding them to the physical IOMMU */
+		if (cmd->dword0 & ~RISCV_IOMMU_CMD0_IOTINVAL_STANDARD ||
+		    cmd->dword1 & ~RISCV_IOMMU_CMD1_IOTINVAL_STANDARD) {
+			ret = -EINVAL;
+			goto out_free;
+		}
+
+		func = FIELD_GET(RISCV_IOMMU_CMD0_FUNC, cmd->dword0);
+		if (func != RISCV_IOMMU_CMD_IOTINVAL_FUNC_VMA) {
+			ret = -EIO;
+			goto out_free;
+		}
+
+		/*
+		 * The guest operates in its own GSCID/PSCID namespace.
+		 * The physical IOMMU uses the host-assigned GSCID and
+		 * PSCID=0. Enforce both for correct cache invalidation.
+		 */
+		cmd->dword0 &= ~(RISCV_IOMMU_CMD0_IOTINVAL_GV |
+				 RISCV_IOMMU_CMD0_IOTINVAL_GSCID |
+				 RISCV_IOMMU_CMD0_IOTINVAL_PSCV |
+				 RISCV_IOMMU_CMD0_IOTINVAL_PSCID);
+		cmd->dword0 |= FIELD_PREP(RISCV_IOMMU_CMD0_IOTINVAL_GSCID,
+					  rv_viommu->gscid) |
+			       RISCV_IOMMU_CMD0_IOTINVAL_GV |
+			       FIELD_PREP(RISCV_IOMMU_CMD0_IOTINVAL_PSCID, 0) |
+			       RISCV_IOMMU_CMD0_IOTINVAL_PSCV;
+
+		riscv_iommu_cmd_send(iommu, cmd);
+	}
+
+	riscv_iommu_cmd_sync(iommu, RISCV_IOMMU_IOTINVAL_TIMEOUT);
+
+out_free:
+	array->entry_num = i;
+	kfree(cmds);
+	return ret;
+}
+
 static const struct iommufd_viommu_ops riscv_viommu_ops = {
 	.alloc_domain_nested = riscv_viommu_alloc_domain_nested,
+	.cache_invalidate = riscv_viommu_cache_invalidate,
 };
 
 static size_t riscv_iommu_get_viommu_size(struct device *dev,
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
