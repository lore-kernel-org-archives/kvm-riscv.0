Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41B60A380A
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 06:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=koNh5pD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lyTBIv0UZ9eCl0i5JJJOmnn9C2WB2nnqA18wiLpaPQ4=; b=koNh5pD7YgmDvS/Bmf1uwmFUGl
	spw8TrEEl+Zfspuip9p88/050wngZTyGFxihO4Wfm5wvdP5A9wzIPia+0VkBn/527rPAySgSIq1gU
	0naq14Ou1+LyORrKdZNQyp4DbQTbnFN6q27MuZ2qZIlqPZ1pNawXnvBQlN1FO/Vc23XWZS+EmT7Z1
	cgE1toFVIEz1fzHvqAIAoLdpkKHZIVzBWLLPnmk7qDRgARNjsGa/ad8Jx+3+29xk1Gkh48FQ/yxVJ
	dJyS8VT0aaDMlfVsVlLirgiOqEyXKL46qt7WQ2sOk8Qw0hU+tkwkgzq+4FodydXzzxPaBonb0wrej
	JxBgl5Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJMg-00000008RPb-34pb;
	Thu, 29 Oct 2026 06:11:54 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJMb-00000008RLJ-3JbU;
	Thu, 29 Oct 2026 06:11:52 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jFYlb3yv3z5PkGs;
	Thu, 29 Oct 2026 14:11:39 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 69T6BVfI003033;
	Thu, 29 Oct 2026 14:11:31 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 29 Oct 2026 14:11:33 +0800
X-Zmail-TransId: 3e816ae2e38e027-e7c7d
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
Subject: [RFC PATCH v2 0/9] iommu/riscv: Add nested translation (vIOMMU) support
Date: Thu, 29 Oct 2026 14:11:22 +0800
Message-ID: <20261029061131.584453-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69T6BVfI003033
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 29 Oct 2026 14:11:39 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AE2E39B.001/4jFYlb3yv3z5PkGs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_231150_205810_15C10895 
X-CRM114-Status: GOOD (  20.44  )
X-Spam-Score: -0.9 (/)
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

An IOMMU allows an OS to restrict device DMA to the intended memory.
It also gives device drivers an IOVA space that is independent of the
physical memory layout. A guest OS needs these capabilities when it
directly controls a device, just as a native OS does.

Exposing a vIOMMU to the guest is not enough for a passthrough device.
DMA from the physical device must also obey the mappings that the guest
creates through its vIOMMU. Otherwise the guest cannot use its IOMMU to
protect guest memory or provide IOVA mappings for the assigned device.

The RISC-V IOMMU architecture supports this usage with two-stage
translation. Stage 1 applies the guest's vIOMMU configuration. Stage 2
is controlled by the hypervisor and restricts the device to memory
assigned to the VM. This division gives the guest control of its own
DMA mappings without allowing the device to escape the VM.

The Linux RISC-V IOMMU driver does not yet support this model through
iommufd. A VMM cannot provide the guest stage 1 configuration to the
physical IOMMU or synchronize its translation caches after the guest
updates its page tables. This series adds the missing nested
translation support so device passthrough can work with a guest that
uses its own vIOMMU.

This is an RFC and comments on the design are welcome.

Patch organization

Patch 1 prepares device context handling for nested translation.
Patches 2 and 3 add the uAPI for nested allocation and cache
invalidation.
Patches 4 to 6 add the vIOMMU, nested domains and cache invalidation.
Patches 7 and 8 allow a VMM to discover the physical IOMMU
capabilities.
Patch 9 adds nested device attachment.

Dependencies

The series applies on top of linux-iommu/next at 20bfd25757659f with
the generic iommu page table for SMMUv3 v2 [1], the RISC-V hardware
dirty tracking series v5 [2], and the generic_pt fix that adds Svpbmt
to the RISC-V supported feature mask.

Testing

The test requires MSI support, but the related dependencies are still
under review, so the interrupt changes are not included in this series.
The test needs the MSI remapping series v6 [3], the irqbypass series
RFC v3 [4] and a KVM client from Andrew's github repo [5].A branch with
the complete test stack, including the additional nested interrupt
support, is available at github repo [6].

The host is a RISC-V machine whose physical IOMMU is provided by an outer
QEMU riscv-iommu model, which implements both translation stages. An NVMe
controller under it is bound to vfio-pci and passed through to the guest.
The guest is started by a QEMU built with the accel series [7][8], which
exposes a first stage IOMMU to the guest and leaves the second stage to
the host IOMMU. For simplicity the guest runs the same kernel as the host,
and inside the guest it mainly uses the normal IOMMU driver and the NVMe
driver.

The layering of the setup is

Host HW, a RISC-V virt machine from latest QEMU(v11.1.2), with a
riscv-iommu model that implements two stage translation and with the NVMe
controller

    Host OS, the kernel with this series
      riscv-iommu driver, second stage and MSI table vfio-pci and KVM

        Guest HW, QEMU with the accel series [7][8]
          riscv-iommu accel, first stage only

            Guest OS, the same kernel as the host
              riscv-iommu driver, NVMe driver

A DMA address from the NVMe controller is translated by the guest first
stage and then by the host second stage on the physical IOMMU. An MSI
address is translated by the guest first stage into a guest IMSIC address,
which the flat MSI table then resolves straight to the interrupt file of
the target vCPU, instead of walking the second stage.

    DMA    device --> guest first stage --> host second stage --> RAM
    MSI    device --> guest first stage --> MSI table --> VS-file

The host was started with

$HOST_QEMU \
  -M virt,aia=aplic-imsic,aia-guests=7,iommu-sys=on \
  -cpu rva23s64,sv48=on -nographic \
  -smp 16 -m 16G \
  -kernel $HOST_KERNEL \
  -append "root=/dev/vda rw earlycon=sbi console=ttyS0 iommufd.allow_unsafe_interrupts=1" \
  -drive file=$HOST_ROOTFS,if=none,id=d0,format=qcow2 -device virtio-blk-device,drive=d0 \
  -device pcie-root-port,id=port0,chassis=0,slot=0,addr=3.0 \
  -drive file=fake-nvme-disk.img,if=none,id=nvme0,format=qcow2 \
  -device nvme,drive=nvme0,serial=deadbeef,bus=port0,addr=0.0

and the guest with

$GUEST_QEMU \
  -machine virt,accel=kvm,aia=aplic-imsic,aia-guests=5 \
  -cpu host -nographic \
  -smp 4 -m 4G \
  -object iommufd,id=iommufd0 \
  -device riscv-iommu-pci,addr=1.0,s-stage=on,g-stage=off,accel=on \
  -device vfio-pci,host=0000:01:00.0,iommufd=iommufd0 \
  -kernel $GUEST_KERNEL \
  -append "root=/dev/vda rw earlycon=sbi console=ttyS0 iommu.passthrough=0 iommu.strict=1" \
  -drive file=$GUEST_ROOTFS,if=none,id=d0,format=qcow2 -device virtio-blk-device,drive=d0

Correctness was checked by running fio with verification enabled against
the passed through disk.

Known limitations and future work

PASID and the process directory table are not supported, PDTV is rejected
and PSCID is fixed at 0. The ATS, PRI and T2GPA fields are validated on
the nested domain, but ATS.INVAL and the PRI queue are not forwarded. A
vIOMMU is bound to a single physical IOMMU instance. The new uAPI types
have no selftest coverage yet.

Coding assistants based on LLMs were used during development for code
exploration, patch review, test execution and for drafting and editing
commit messages. We have reviewed and finalized all resulting code and
text.

Changes in v2:

- Rebased on linux-iommu/next at 20bfd25757659f and the hardware
  dirty tracking series v5 [2].
- Rewrote the commit messages and updated the uAPI definitions (Jason's
  suggestions).
- Drop the MSI related patches (Jason's suggestions).
- Link to v1:
  https://lore.kernel.org/linux-riscv/20261015065232.604503-1-gong.shuai@sanechips.com.cn/


[1] https://lore.kernel.org/linux-iommu/0-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com/
[2] https://lore.kernel.org/linux-riscv/20261020094106.92722-1-fangyu.yu@linux.alibaba.com/
[3] https://lore.kernel.org/all/20260925151659.419512-1-andrew.jones@oss.qualcomm.com/
[4] https://lore.kernel.org/linux-riscv/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/
[5] https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v3-kvm/
[6] https://github.com/leaprise/linux/tree/riscv/iommu-nested-rfc-v2
[7] https://lore.kernel.org/qemu-devel/20261029054751.563493-1-gong.shuai@sanechips.com.cn/
[8] https://github.com/leaprise/qemu/tree/riscv/iommu-nested-rfc-v2


Gong Shuai (2):
  iommu/riscv: Use DC.tc.V as the device context valid bit
  iommu/riscv: Add vIOMMU cache invalidation

Wu Fei (7):
  iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
  iommufd: Add RISC-V IOMMU cache invalidation data type
  iommu/riscv: Add vIOMMU object support
  iommu/riscv: Add nested domain allocation
  iommufd: Add RISC-V IOMMU hardware info type
  iommu/riscv: Add riscv_iommu_hw_info
  iommu/riscv: Add riscv_iommu_attach_dev_nested

 drivers/iommu/riscv/iommu-bits.h |  19 ++
 drivers/iommu/riscv/iommu.c      | 391 +++++++++++++++++++++++++++++--
 include/uapi/linux/iommufd.h     |  81 +++++++
 3 files changed, 475 insertions(+), 16 deletions(-)

-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
