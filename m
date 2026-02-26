Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A5FFC5913
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e/aGglr2Tac5aV3EMY+4YWNao9HOx63nkY3pbQjaKZk=; b=0a3DfmDwXEjuXa
	2oG/LW83vQCSn7CLP3GGVA4bzNCesWCkwzj88LX8KepHdi0bwb97zO0ZStLYEJTL17hVjeBduD/9p
	1LSt6s7CBtIfqftyWNeipk+PmEJUcS9+DQXXfeKuAT1qap9A1LBt7S/KTFbctFxoZU6svn2b0FDy6
	gzk3jCCLxCqPi5lcTjDsxprCrwBMelXaj7JObbNYf2CzQxWECvPrNsKFFHvcUpjnYWaOUM+SRfy8x
	RmEW/MQD0LjMBRPe1tFizxyWkoL+Lp+aeANO5gc8ohSRpEQM2PTSWSZ2wJXDPUTww3S8wXhRRHd7Z
	h4jPIBj8YLJpfqzKnD5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX5u-00000005i16-2qgh;
	Thu, 26 Feb 2026 08:51:38 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX5k-00000005hzu-0eus;
	Thu, 26 Feb 2026 08:51:37 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-01 (Coremail) with SMTP id qwCowADnkGyJCaBpC0_FCA--.1935S2;
	Thu, 26 Feb 2026 16:51:22 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
Date: Thu, 26 Feb 2026 08:51:19 +0000
Message-Id: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADnkGyJCaBpC0_FCA--.1935S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyUuryxKr4Dtr47Cry5twb_yoW8tw1Dpr
	ZxCrnYkryxXF4xC39rAwn7Xr4vgr4jkF15Wr98W3y5Wr4UtFWFvr1vg348XFWUJFy8Zas2
	yF1UCF4F9F1UXw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwV
	W8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUx5rcUUUUU
	=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwkKCWmf1qe6iQAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_005128_554876_932E85E2 
X-CRM114-Status: GOOD (  10.08  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

kvm_riscv_vcpu_aia_rmw_topei() assumes that the per-vCPU IMSIC state has
been initialized once AIA is reported as available and initialized at
the VM level. This assumption does not always hold.

Under fuzzed ioctl sequences, a guest may access the IMSIC TOPEI CSR
before the vCPU IMSIC state is set up. In this case,
vcpu->arch.aia_context.imsic_state is still NULL, and the TOPEI RMW path
dereferences it unconditionally, leading to a host kernel crash.

The crash manifests as:
  Unable to handle kernel paging request at virtual address
  dfffffff0000000e
  ...
  kvm_riscv_vcpu_aia_imsic_rmw arch/riscv/kvm/aia_imsic.c:909
  kvm_riscv_vcpu_aia_rmw_topei arch/riscv/kvm/aia.c:231
  csr_insn arch/riscv/kvm/vcpu_insn.c:208
  system_opcode_insn arch/riscv/kvm/vcpu_insn.c:281
  kvm_riscv_vcpu_virtual_insn arch/riscv/kvm/vcpu_insn.c:355
  kvm_riscv_vcpu_exit arch/riscv/kvm/vcpu_exit.c:230
  kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:1008
  ...

Fix this by explicitly checking whether the vCPU IMSIC state has been
initialized before handling TOPEI CSR accesses. If not, forward the CSR
emulation to user space.

Fixes: db8b7e97d6137 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V1 -> V2: Moved imsic_state NULL check into kvm_riscv_vcpu_aia_imsic_rmw().
          Updated Fixes tag to db8b7e97d6137.
---
 arch/riscv/kvm/aia_imsic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index fda0346f0ea1f..60917f4789d84 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -892,6 +892,10 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 	int r, rc = KVM_INSN_CONTINUE_NEXT_SEPC;
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
 
+	/* If IMSIC vCPU state not initialized then forward to user space */
+	if (!imsic)
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
 	if (isel == KVM_RISCV_AIA_IMSIC_TOPEI) {
 		/* Read pending and enabled interrupt with highest priority */
 		topei = imsic_mrif_topei(imsic->swfile, imsic->nr_eix,
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
