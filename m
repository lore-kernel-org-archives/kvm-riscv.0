Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2EA2D49C92
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 10:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+JJa3DBnHdFHHzveoAPpJIKTr/0v9JEyhT+ENrl6eQg=; b=gr6TNt+pVpvH6t
	YqDmEvKFlE4b0tMUcMxihJSBxg9hpbHufMLoC6XPjM34c6rgsYFm2t9LL5ITg641/4LOSJb5oPvz5
	nGLHb2arTRNXCa1y/qXaYbtafls9D38tbIUGjvnJG6Dg6/3X4K6xoIfEjg+UI5PCSf9+TLdFaCbRS
	1gXTQYvm7oXpfS3pSTA0wt1IT1t65C0C+4ozi0uxUqQs+HU8fBmFztCz5cd5tWUEiB47kTerkz8Ar
	KlU6lMpQSLJTt2dRVVDkENfBJzl+tsIkKxm0AJ/o7hOWBJF1ydOf3gakB5gW2tujPUkWWKpIPFlbq
	swbxiO1xOLpz916tJw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXr-00000001Iwi-1a9Z;
	Fri, 30 Jan 2026 10:16:09 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXo-00000001Iv8-1mvl;
	Fri, 30 Jan 2026 10:16:05 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAA3zRDehHxpX_wMBw--.48711S2;
	Fri, 30 Jan 2026 18:15:58 +0800 (CST)
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
Subject: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
Date: Fri, 30 Jan 2026 10:15:57 +0000
Message-Id: <20260130101557.1314385-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAA3zRDehHxpX_wMBw--.48711S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFyUuryxKr4Dtr47Cry5twb_yoW8Zw45pF
	sxCrsa9r48XFWxCasIywn7Xr40gr4vkF1aqr98urW5Gr4UKFWFyr1vgay7XFW8JF10vwn2
	yr4UCFW8uF1UJw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5o7KDUUU
	U
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBgwDCWl8VkKsNAAAsZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_021604_848982_9F85420F 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
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

Fixes: 2f4d58f7635ae ("RISC-V: KVM: Virtualize per-HART AIA CSRs")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..c176b960d8a40 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -228,6 +228,10 @@ int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 	if (!kvm_riscv_aia_initialized(vcpu->kvm))
 		return KVM_INSN_EXIT_TO_USER_SPACE;
 
+	/* If IMSIC vCPU state not initialized then forward to user space */
+	if (!vcpu->arch.aia_context.imsic_state)
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
 	return kvm_riscv_vcpu_aia_imsic_rmw(vcpu, KVM_RISCV_AIA_IMSIC_TOPEI,
 					    val, new_val, wr_mask);
 }
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
