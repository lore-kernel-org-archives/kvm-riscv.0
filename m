Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659CEFA0C43
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iFAkcRQAenBuRSbmJlSUBlyWrVrjaavpvIwzveImE+o=; b=MreByO8rcJ3A0I
	k4UQtq/Fqj9m05kWc8y0b9OXcneQJkvvxHwpLaUW8zQpi+q1alsyAfGnnmbDzWirslDUcYWwWhZTu
	5Fr9XxSsEsVwBg3iGL8A1D6aJADhbeLdFa+OCB90p8rbfuB037IIAJUH9LFbJqeR5E6m5S++pJakA
	DrxTbzv9K7wMdhR6DJIxCZYqpgc7nkXI6Y+Kel4zp2iHmppEJHR6ZoEyqXkbyujxQDRZnNeCSm2IC
	nQxAJUvHEZLfVDegA42VDUxxo99chH0pPHPfnhcOggRfLFDuJx0Gfj+m2k5opLEMBdVKpHDdhB23n
	w3uyLo8A5vxeTrsKEWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCv38-00000000kzd-2qXU;
	Wed, 15 Apr 2026 07:52:38 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCv34-00000000kz3-1j6N;
	Wed, 15 Apr 2026 07:52:36 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowABH1QiyQ99pSIKTDQ--.36677S2;
	Wed, 15 Apr 2026 15:52:18 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix invalid HVA warning in steal-time recording
Date: Wed, 15 Apr 2026 07:52:16 +0000
Message-Id: <20260415075216.2757427-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowABH1QiyQ99pSIKTDQ--.36677S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF15Kr48ur1UKw13Jr4fXwb_yoW8AF15pF
	ZrCr98Ww1rtry2gasrAr4kWa1jg3yvgF1qgr9I9F90yrs0kFyYyrsYk34IvFyUJry0qF1r
	ZF1YqF1Duan8AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBI14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbQVy7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBg0SCWnfJvJ8DgAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_005234_822018_7F9859D8 
X-CRM114-Status: GOOD (  14.05  )
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

kvm_riscv_vcpu_record_steal_time() assumes that the steal-time shared
memory GPA (vcpu->arch.sta.shmem) is always backed by a valid guest
memory slot. However, this assumption is not guaranteed by the KVM
userspace ABI.

A malicious or buggy userspace can set the STA shared memory GPA via
KVM_SET_ONE_REG without establishing a corresponding memory region via
KVM_SET_USER_MEMORY_REGION. In such cases, the GPA cannot be translated
to a valid HVA and kvm_vcpu_gfn_to_hva() returns an error address.

The current implementation incorrectly treats this as a kernel warning
using WARN_ON(), which may escalate to a kernel panic when panic_on_warn
is enabled.

This is not a kernel bug condition but a normal invalid configuration
from userspace, and should be handled gracefully.

Fix it by removing WARN_ON() and treating invalid HVA as a normal
failure case, resetting the STA shared memory state.

Fixes: e9f12b5fff8ad0 ("RISC-V: KVM: Implement SBI STA extension")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Assisted-by: OpenClaw:DeepSeek-V3.2
---
 arch/riscv/kvm/vcpu_sbi_sta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 3b834709b429f..60e50296a0085 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -46,7 +46,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 	gfn = shmem >> PAGE_SHIFT;
 	hva = kvm_vcpu_gfn_to_hva(vcpu, gfn);
 
-	if (WARN_ON(kvm_is_error_hva(hva))) {
+	if (kvm_is_error_hva(hva)) {
 		vcpu->arch.sta.shmem = INVALID_GPA;
 		return;
 	}
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
