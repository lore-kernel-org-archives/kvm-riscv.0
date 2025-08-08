Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B3BC87FDA
	for <kvm-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXbqCQY/bcqpsOU/j50mLeNzZZ6r/lwww6On7y05o1Y=; b=q448PJwJJPjmoM
	j06eDqc02pUD61jz30yDolbFMA8ZY40+RmUP6njyRTBfOLXC7duHb1/xYzD3K8vMYnuPmDhePIzr1
	aneZxJue8NCCT0co0Umgz2PHFGCCzukvOMk5D0knIiTP7+XspyUUsMo7I4bzBpwq+jSo1A6tvRSFf
	2klKzwgagdLhjodOdo/nBuKsqWtPDJp+IKQHU7+g9RjVb4RzduX9JYfvfRJiSD7CrMY7TSU3FEzbl
	levD41m+6u8JGzOwG4voRLOa5E+ks5YuowWOyrdr0zpdfwCsxQawBUefgKkOcv4jTIloYheb5HIWf
	vduo+AcqOoH1MHsIVYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKcZ-00000002avJ-46UO;
	Fri, 08 Aug 2025 10:46:47 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKMy-00000002Z58-1Mva;
	Fri, 08 Aug 2025 10:30:41 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.92.164])
	by APP-03 (Coremail) with SMTP id rQCowAB3DH6s0ZVo1RpQCg--.7060S2;
	Fri, 08 Aug 2025 18:30:04 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 2/6] RISC-V: KVM: Provide UAPI for Zicbop block size
Date: Fri,  8 Aug 2025 18:18:34 +0800
Message-Id: <befd8403cd76d7adb97231ac993eaeb86bf2582c.1754646071.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1754646071.git.zhouquan@iscas.ac.cn>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAB3DH6s0ZVo1RpQCg--.7060S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw1DtryUXr45ZFy3XFyxZrb_yoW5GrWDpF
	sxCrsY9r409ryS9rZ7ArykWr4Ygwn8Gws3trZ293y8JF9rtFWrGr4kKr9xAFW0qFW8XF4I
	93Z5Gry09an8tw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8tw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDcTdUUUUU=
X-Originating-IP: [121.237.92.164]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCQ4IBmiVopSTXQABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_033040_723266_E136F0E0 
X-CRM114-Status: GOOD (  10.85  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

We're about to allow guests to use the Zicbop extension.
KVM userspace needs to know the cache block size in order to
properly advertise it to the guest. Provide a virtual config
register for userspace to get it with the GET_ONE_REG API, but
setting it cannot be supported, so disallow SET_ONE_REG.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu_onereg.c      | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289da1..bb200f82d08e 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -56,6 +56,7 @@ struct kvm_riscv_config {
 	unsigned long mimpid;
 	unsigned long zicboz_block_size;
 	unsigned long satp_mode;
+	unsigned long zicbop_block_size;
 };
 
 /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 6bd64ae17b80..cf5003eb2e41 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -286,6 +286,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
+		if (!riscv_isa_extension_available(NULL, ZICBOP))
+			return -ENOENT;
+		reg_val = riscv_cbop_block_size;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		reg_val = vcpu->arch.mvendorid;
 		break;
@@ -377,6 +382,12 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		if (reg_val != riscv_cboz_block_size)
 			return -EINVAL;
 		break;
+	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
+		if (!riscv_isa_extension_available(NULL, ZICBOP))
+			return -ENOENT;
+		if (reg_val != riscv_cbop_block_size)
+			return -EINVAL;
+		break;
 	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
 		if (reg_val == vcpu->arch.mvendorid)
 			break;
@@ -822,6 +833,9 @@ static int copy_config_reg_indices(const struct kvm_vcpu *vcpu,
 		else if (i == KVM_REG_RISCV_CONFIG_REG(zicboz_block_size) &&
 			!riscv_isa_extension_available(NULL, ZICBOZ))
 			continue;
+		else if (i == KVM_REG_RISCV_CONFIG_REG(zicbop_block_size) &&
+			!riscv_isa_extension_available(NULL, ZICBOP))
+			continue;
 
 		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
 		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_CONFIG | i;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
