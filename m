Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3F606B1DB
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oUtSovuI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=S1bqBv+XEQebnd+FEO1+Sp9Vw9wLKnsP7znRu9wtxso=; b=oUtSovuIRfyxUA4EItoFqxRASC
	S+mlzIsGRFwueryeNKjRPcVq69yypGycvPZgQcF6X+Zl4DXXvjM0hHF179rRAxhduVDy3QPUzah/6
	GXcw50Mla0Tnqaiey5geLktRKOz8J3d+I7Ze/oBARD2MwsIQjMQpO9zNgG/4wBvckBpplK47jsJl5
	7odpJNmlDo+W//xmFhIJVcmMljkhCM7Ueg7uPDBQB68jISTxwoZl28HIOuylMJwBCX2UJZjI3yXhA
	RL1i+qCRsZDasiFBmxdpRL8emA9qEo+TLWWcc0L2vmGC2pSQ1G4MLD7CNMlzHHamCzPvyxR3gWI/T
	1FNAiHlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BW-0000000C2SJ-3L0M;
	Thu, 19 Nov 2026 13:28:18 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2BP-0000000C2Iz-07RT;
	Thu, 19 Nov 2026 13:28:17 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jVfRH1jbzz8XrrJ;
	Thu, 19 Nov 2026 21:27:55 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 6AJDRmY7086378;
	Thu, 19 Nov 2026 21:27:48 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 19 Nov 2026 21:27:51 +0800
X-Zmail-TransId: 3e816afef95002f-56441
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
Subject: [RFC PATCH v3 00/10] iommu/riscv: Add nested translation (vIOMMU) support
Date: Thu, 19 Nov 2026 21:27:34 +0800
Message-ID: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 6AJDRmY7086378
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 19 Nov 2026 21:27:55 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFEF95B.000/4jVfRH1jbzz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_052811_415254_922EC62D 
X-CRM114-Status: GOOD (  23.27  )
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
Patch 10 fixes bond unlink so it invalidates the correct address space.

Dependencies

The series applies on top of iommu/master at commit 9f9dc924a01e,
together with the RISC-V hardware dirty tracking series v7 [1] and
its dependencies.

Testing

The test requires MSI support, but the related dependencies are still
under review, so the interrupt changes are not included in this series.
The test needs the MSI remapping series v6 [2], the irqbypass series
RFC v3 [3] and a KVM client from Andrew's github repo [4]. A branch with
the complete test stack, including the additional nested interrupt
support, is available at github repo [5].

The host is a RISC-V machine whose physical IOMMU is provided by an outer
QEMU riscv-iommu model, which implements both translation stages. An NVMe
controller under it is bound to vfio-pci and passed through to the guest.
The guest is started by a QEMU built with the accel series [6][7], which
exposes a first stage IOMMU to the guest and leaves the second stage to
the host IOMMU. For simplicity the guest runs the same kernel as the host,
and inside the guest it mainly uses the normal IOMMU driver and the NVMe
driver.

The layering of the setup is

Host HW, a RISC-V virt machine from latest QEMU(v11.1.3), with a
riscv-iommu model that implements two stage translation and with the NVMe
controller

    Host OS, the kernel with this series
      riscv-iommu driver, second stage and MSI table vfio-pci and KVM

        Guest HW, QEMU with the accel series [6][7]
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

- PASID and the process directory table are not supported.
- The ATS, PRI and T2GPA fields are validated on the nested domain, but
  ATS.INVAL and the PRI queue are not forwarded.
- One single physical IOMMU instance on host is assumed for now.
- The new uAPI types have no selftest coverage yet.

Coding assistants based on LLMs were used during development for code
exploration, patch review, test execution and for drafting and editing
commit messages. We have reviewed and finalized all resulting code and
text.

Changes in v3:

- Rebased on iommu/master at 9f9dc924a01e and the hardware
  dirty tracking series v7 [2].
- Use the guest PSCID directly and allocate a separate host GSCID for
  each vIOMMU to ensure that the (GSCID, PSCID) pair programmed into the
  physical DC uniquely identifies the correct nested address space
  (suggested by Tan Chi and Jason).
- Fixes bond unlink so it invalidates the correct address space, using
  GSCID for second stage bonds and PSCID for first stage bonds.
- Link to v2:
  https://lore.kernel.org/linux-riscv/20261029061131.584453-1-gong.shuai@sanechips.com.cn/

Changes in v2:

- Rebased on linux-iommu/next at 20bfd25757659f and the hardware
  dirty tracking series v5.
- Rewrote the commit messages and updated the uAPI definitions (Jason's
  suggestions).
- Drop the MSI related patches (Jason's suggestions).
- Link to v1:
  https://lore.kernel.org/linux-riscv/20261015065232.604503-1-gong.shuai@sanechips.com.cn/


[1] https://lore.kernel.org/linux-riscv/20261103120236.53474-1-fangyu.yu@linux.alibaba.com/
[2] https://lore.kernel.org/all/20260925151659.419512-1-andrew.jones@oss.qualcomm.com/
[3] https://lore.kernel.org/all/20260928143113.49838-1-andrew.jones@oss.qualcomm.com/
[4] https://github.com/jones-drew/linux/commits/riscv/iommu-irqbypass-rfc-v3-kvm/
[5] https://github.com/leaprise/linux/tree/riscv/iommu-nested-rfc-v3
[6] https://lore.kernel.org/qemu-devel/20261119131524.395861-1-gong.shuai@sanechips.com.cn/
[7] https://github.com/leaprise/qemu/tree/riscv/iommu-nested-rfc-v3


Gong Shuai (3):
  iommu/riscv: Use DC.tc.V as the device context valid bit
  iommu/riscv: Add vIOMMU cache invalidation
  iommu/riscv: Flush the right address space on bond unlink

Wu Fei (7):
  iommufd: Add RISC-V IOMMU hwpt and vIOMMU types
  iommufd: Add RISC-V IOMMU cache invalidation data type
  iommu/riscv: Add vIOMMU object support
  iommu/riscv: Add nested domain allocation
  iommufd: Add RISC-V IOMMU hardware info type
  iommu/riscv: Add riscv_iommu_hw_info
  iommu/riscv: Add riscv_iommu_attach_dev_nested

 drivers/iommu/riscv/iommu-bits.h |  19 ++
 drivers/iommu/riscv/iommu.c      | 468 ++++++++++++++++++++++++++++---
 include/uapi/linux/iommufd.h     |  84 ++++++
 3 files changed, 533 insertions(+), 38 deletions(-)

-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
