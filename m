Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA260A2611
	for <kvm-riscv@archiver.kernel.org>; Sat, 31 Oct 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f9gULNHX;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZembZGWz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UAYmLRG1bJNVyt+gxX0QLq3oqrglHyhuYcqk/qfhg6w=; b=f9gULNHX07IO+KCElLG6oSvc5L
	xHVTjmVnSZEsHWMJ6SKyLStuV8gN6zRWsplcXapcMOXF3tTm0mfLLJeNk5kMXLeou8AF0T5RcW5vV
	84rqGzOg2VNKiGvqtcrxc3xlfQrMWp8M3CApkE1WV9Zio/7A1rBhTLhlHc2U1zgtM1myCyiGFHfN2
	5MZhLN2yWsQab7AC6CyD/jGJ5NgbnamKIZ8/gwhNEiYjXWjwLigZ0HIcvWNij4C0XFuVhGD035q1s
	gX5Bwty0zxRvgYlIm4d8AZR/j7mGyfebVQIogsU/Q8DlgX2Sdk5VwtuY6Q8ZSdheaMyc2KCGVjgDN
	3qyQJbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4U5-0000000D3cl-2zlG;
	Sat, 31 Oct 2026 08:30:41 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4Tt-0000000D3Vh-3LI9;
	Sat, 31 Oct 2026 08:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793435421; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=fytrSwMAocM2/QBU3ULUTJt5nlk8iqp0tjge5H6XjD8=;
	b=ZembZGWzjuYZ+zRQq+sOlgsuIdaD3rQgW8V0+PmuRZefuR39+t5z67BJhxHORY7m4xdlu+UGU+r9+pGjPP9L3mQEWmdV2EoyT47CYroTVmNWSmnkkkrrNafvr/Aox383qP3fqcMuBBPYCg4FW8xQTSg+fFZvc7Zjj4B3sSQ4+Uw=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R621e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XDo-2iC_1793435417;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XDo-2iC_1793435417 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 31 Oct 2026 16:30:19 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kevin.tian@intel.com,
	atish.patra@linux.dev,
	skhawaja@google.com,
	vasant.hegde@amd.com,
	joerg.roedel@amd.com,
	tanchi25@mails.ucas.ac.cn,
	gong.shuai@sanechips.com.cn
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v6 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Sat, 31 Oct 2026 16:30:04 +0800
Message-Id: <20261031083014.15040-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_013030_431568_70F82099 
X-CRM114-Status: GOOD (  13.39  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

The RISC-V IOMMU architecture defines an AMO_HWAD capability (Hardware
Access/Dirty update) that allows the IOMMU to atomically set the A/D bits
in second-stage PTEs on DMA access.  When DC.tc.GADE is asserted, the IOMMU
autonomously sets D on the first write to a page mapped by an iohgatp
domain.  This series wires that capability up to the iommufd dirty-tracking
interface (IOMMU_HWPT_SET_DIRTY_TRACKING / IOMMU_HWPT_GET_DIRTY_BITMAP) and
reports IOMMU_CAP_DIRTY_TRACKING.

Design notes
============

* The feature is scoped to second-stage (iohgatp) domains only; these are
  the domains created for KVM / VFIO device pass-through when userspace
  allocates an HWPT with IOMMU_HWPT_ALLOC_NEST_PARENT or
  IOMMU_HWPT_ALLOC_DIRTY_TRACKING.  First-stage (iosatp) domains are not
  touched by this series.

* The page-table side plugs into the existing generic_pt dirty hook
  framework (amdv1 / vtdss style).  RISC-V adds the three required PTE
  ops - is_write_dirty / make_write_clean / make_write_dirty.

Testing
=======

* Test on QEMU RISC-V, a nvme and an e1000e device was passed through
  to an L2 guest via vfio-pci + iommufd.

* generic_pt KUnit: the existing test_dirty case now runs and passes for
  the RISC-V 64-bit format.

Follow-up work
==============
* Build a dedicated end-to-end test case that drives the full flow
  (HWPT_ALLOC with DIRTY_TRACKING -> attach -> IOAS_MAP -> generate real
  DMA -> SET_DIRTY_TRACKING -> GET_DIRTY_BITMAP -> verify bitmap against
  expected IOVA footprint) so that the behaviour can be regression-tested
  beyond the KUnit PTE-level coverage.

LLM-based coding assistants were used for code exploration, patch
review, test execution, and drafting/editing messages and this cover
letter. I reviewed and finalized all resulting code and text.

This series functionally depends on [1], which has been posted but is not
yet in mainline. 

---
Changes in v6:
    - Drop the RFC tag.
    - Rebased on top of mainline (390febb5805d).
    - Carry the unmerged prerequisite [2] as patch 1.
    - Drop "iommu/riscv: report iommu capabilities"; mainline commit
      3069e8f3e1e9 ("iommu/riscv: Report cache coherency capability")
      already adds riscv_iommu_capable().
    - domain_alloc_paging_flags: drop the redundant flags pre-check and
      supported_flags, and split the per-stage setup into
      riscv_iommu_init_domain_s1() / riscv_iommu_init_domain_s2().
      (Per Jason)
    - Link to v5:
      https://lore.kernel.org/linux-iommu/20261020094106.92722-1-fangyu.yu@linux.alibaba.com/
Changes in v5:
    - Propagate the GADE bit from the new device context into the hardware
      DC in riscv_iommu_iodir_update(), so the pre-enabled GADE actually
      reaches the hardware. (Per Gong Shuai)
    - Issue a global IOTINVAL.GVMA in riscv_iommu_iodir_set_mode(), so that
      second-stage translations cached before a DDTP mode change (e.g. by
      a previous kernel after kexec) are flushed as the specification
      requires. (Per Tan Chi)
    - Rebased on top of v7.3, with [1] and [2] applied.
    - Link to v4:
      https://lore.kernel.org/linux-riscv/20260915032828.11250-1-fangyu.yu@linux.alibaba.com/
Changes in v4 (Jason's suggestions):
    - Rebased the series on top of [1] and [2].
    - Drop the RISC-V-specific pt_num_items_lg2() top-level special case.
    - Validate page-table address widths by translation stage: accept only
      Sv39/Sv48/Sv57 widths for first-stage tables and only Sv39x4/Sv48x4/
      Sv57x4 widths for second-stage tables.
    - Replace the aliased first-stage/second-stage MODE union with
      independent FSC/IOSATP and IOHGATP MODE fields.
    - Add pt_dirty_supported() to restrict RISC-V generic_pt dirty tracking
      to second-stage tables.
    - Link to v3:
      https://lore.kernel.org/linux-riscv/20260821132749.82070-1-fangyu.yu@linux.alibaba.com/
Changes in v3 (Andrew Jones's suggestions):
    - Rebased the series on top of Andrew Jones' generic_pt RISC-V supported
      feature mask fix, which adds PT_FEAT_RISCV_SVPBMT to the supported feature
      set.
    - Added PT_FEAT_RISCV_S2 to the RISC-V generic_pt supported feature mask and
      KUnit feature matrix.
    - Kept PT_FEAT_SIGN_EXTEND only for first-stage RISC-V KUnit configs; second
      stage configs now use PT_FEAT_RISCV_S2 without sign-extension semantics.
    - Split RISC-V IOMMU capability checks into first-stage FSC and second-stage
      IOHGATP helpers.
    - Updated second-stage paging domain setup to use GPA widths 41/50/59 and to
      avoid PT_FEAT_SIGN_EXTEND.
    - Link to v2:
      https://lore.kernel.org/linux-riscv/20260507113706.11400-1-fangyu.yu@linux.alibaba.com/
Changes in v2 (Jason's suggestions):
    - Introduced a single PT_FEAT_RISCV_S2: second-stage selection is driven
      purely by this feature bit.
    - Switched from dynamic DC.tc.GADE toggling to static pre-enable.
    - domain_alloc_paging_flags: follow the switch/case design from other
      drivers.
    - Drop IOMMU_CAP_DEFERRED_FLUSH in riscv_iommu_capable.
    - Remove the .hw_info-related patch.
    - Link to v1:
      https://lore.kernel.org/linux-riscv/20260428131359.34872-1-fangyu.yu@linux.alibaba.com/

[1] https://lore.kernel.org/linux-iommu/1-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com/
[2] https://lore.kernel.org/linux-iommu/20260818092444.42755-1-andrew.jones@oss.qualcomm.com/

Andrew Jones (1):
  iommu/generic_pt: Fix the RISC-V supported feature mask

Fangyu Yu (6):
  iommupt: Add RISC-V Second-stage (iohgatp) page table support
  iommupt: Add RISC-V dirty tracking PTE ops
  iommu/riscv: Add domain_alloc_paging_flags for second-stage domain
  iommu/riscv: Pre-enable GADE for second-stage domains
  iommu/riscv: Add dirty tracking support for second-stage domains
  iommu/riscv: Add IOTINVAL.GVMA invalidations

Tomasz Jeznach (1):
  RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch

Zong Li (2):
  iommu/riscv: use data structure instead of individual values
  iommu/riscv: support GSCID and GVMA invalidation command

 arch/riscv/kvm/Kconfig                       |   2 +
 drivers/iommu/generic_pt/fmt/iommu_riscv64.c |   3 +-
 drivers/iommu/generic_pt/fmt/riscv.h         | 158 ++++++++++--
 drivers/iommu/riscv/iommu-bits.h             |   7 +
 drivers/iommu/riscv/iommu.c                  | 238 +++++++++++++++----
 include/linux/generic_pt/common.h            |   4 +
 include/linux/generic_pt/iommu.h             |  11 +
 7 files changed, 353 insertions(+), 70 deletions(-)


base-commit: 390febb5805d3bb830402679f277f1d5f309e6bc
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
