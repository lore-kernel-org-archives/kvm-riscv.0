Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D108606AA55
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lOqzlpU1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DizmEeSDRoxpONmEvsjJ0eEAi3m5revXM9iAzZeIzkY=; b=lOqzlpU19qnd+WF8OIAtjHVe14
	pqFFc/hNEXLThI5/3U56mUVcbzBxe17arvEnlRA1MUiaiQoP8wjUfutqkBx0pClevveLeFaIvc2sg
	OK4MM6alelXRwlFUy5aTCeiWIa7e4VTDeJtjcut/OeLxuX3SWsyu+5acf0IGzU+nA8pcm2TC2k1ZA
	JlQlpEzHRPdrENA1JsIPvkBRvwI6TsKEuRuocZb/mSN7xpjuNc8Yftc8jvycmHaxr0CwKUt+m+ke6
	AEBFv9ks31tSeFeHJj6frIPNOJbuPHBxCku4mUBW8istEVFemD78b3vz6N9E3WMfpYQYp93GII4nQ
	43oIBcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2Bg-0000000C2eg-3s79;
	Thu, 19 Nov 2026 13:28:28 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BV-0000000C2OK-1MkF;
	Thu, 19 Nov 2026 13:28:19 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jVfRQ3mPdz52SGL;
	Thu, 19 Nov 2026 21:28:02 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl2.zte.com.cn with SMTP id 6AJDRsTS070487;
	Thu, 19 Nov 2026 21:27:54 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:27:57 +0800
X-Zmail-TransId: 3e816afef95c02f-564eb
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
        Tan Chi <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>
Subject: [RFC PATCH v3 06/10] iommu/riscv: Add vIOMMU cache invalidation
Date: Thu, 19 Nov 2026 21:27:40 +0800
Message-ID: <20261119132744.396426-7-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl2.zte.com.cn 6AJDRsTS070487
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Thu, 19 Nov 2026 21:28:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF962.001/4jVfRQ3mPdz52SGL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052818_085126_63764B0F 
X-CRM114-Status: GOOD (  18.20  )
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
the guest GSCID with the host-assigned value so a guest cannot
invalidate cached translations belonging to another guest. Preserve
PSCV and PSCID to retain the invalidation scope requested by the guest,
including global mappings.

Co-developed-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 drivers/iommu/riscv/iommu-bits.h | 13 +++++
 drivers/iommu/riscv/iommu.c      | 89 ++++++++++++++++++++++++++++++++
 2 files changed, 102 insertions(+)

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
index 4f8ce579ef08..4df4411be417 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1850,9 +1850,98 @@ riscv_viommu_alloc_domain_nested(struct iommufd_viommu *viommu, u32 flags,
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
+		 * Each vIOMMU has its own host GSCID, so the guest PSCID can
+		 * be used directly. Preserve PSCV and PSCID to retain the
+		 * invalidation scope requested by the guest.
+		 */
+		cmd->dword0 &= ~(RISCV_IOMMU_CMD0_IOTINVAL_GV |
+				 RISCV_IOMMU_CMD0_IOTINVAL_GSCID);
+		cmd->dword0 |= FIELD_PREP(RISCV_IOMMU_CMD0_IOTINVAL_GSCID,
+					  rv_viommu->gscid) |
+			       RISCV_IOMMU_CMD0_IOTINVAL_GV;
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
 	.destroy = riscv_viommu_destroy,
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
