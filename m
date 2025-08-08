Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCEBCA0EC1
	for <kvm-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UK3X4T8uUi2zdFp0b7GBEVxVsvIbXl0yo24XmMKv5FY=; b=lIIr39JjFEt+QV
	r4JFGKq47n70ULjk+gdB0HWhIEtesM1G3nLevPZf+oXOXyx2sClKK/tPC0KxYuhls0+T1FFZGKaFs
	i59FJ7R16Zecw5r+vj0Frf9hcxweSp5TPApTQ30RHGAiW0Uy/9nuMV0NRsNmfjQk5xayFbLu9mX5L
	4sh+JZoSdVcgjL14X/xBU2BaPKQ9j10LFugq00G/rWOSUwjMwhFAx5QZdgRtGH4IIud2s5MeBc8cV
	ySwJLLASJ6yFX63sJENyKrBtUN0i2xcUAJMgII1DTLnzhpa4qDtesoAKGAeeMdr8GMXE+9VfFZwqW
	5ok+Ts4INXb00uylujRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKca-00000002awo-4Bn8;
	Fri, 08 Aug 2025 10:46:49 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKN9-00000002Z5b-14M3;
	Fri, 08 Aug 2025 10:30:52 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.92.164])
	by APP-03 (Coremail) with SMTP id rQCowABX6Hm20ZVoWR1QCg--.7174S2;
	Fri, 08 Aug 2025 18:30:15 +0800 (CST)
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
Subject: [PATCH v2 3/6] RISC-V: KVM: Allow Zicbop extension for Guest/VM
Date: Fri,  8 Aug 2025 18:18:44 +0800
Message-Id: <db4a9b679cc653bb6f5f5574e4196de7a980e458.1754646071.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1754646071.git.zhouquan@iscas.ac.cn>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABX6Hm20ZVoWR1QCg--.7174S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw4kAF45Gw1xtF4rKrW7Jwb_yoW8WFy3pr
	s5CFZxCr4rA3s3uws7t34DWr48W3y5WwnIk3y7ur1xJFyjkry8JF1qya47JF4DJay09r1k
	uF1Sgr1rZw4Yyr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUDcTdUUUUU=
X-Originating-IP: [121.237.92.164]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBg0IBmiVokWUqQAAsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_033051_655579_1A4769D6 
X-CRM114-Status: UNSURE (   6.84  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zicbop extension for Guest/VM.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index bb200f82d08e..ddaa5c1ecb84 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -186,6 +186,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICCRSE,
 	KVM_RISCV_ISA_EXT_ZAAMO,
 	KVM_RISCV_ISA_EXT_ZALRSC,
+	KVM_RISCV_ISA_EXT_ZICBOP,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cf5003eb2e41..73ce35c776df 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -68,6 +68,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
 	KVM_ISA_EXT_ARR(ZICBOM),
+	KVM_ISA_EXT_ARR(ZICBOP),
 	KVM_ISA_EXT_ARR(ZICBOZ),
 	KVM_ISA_EXT_ARR(ZICCRSE),
 	KVM_ISA_EXT_ARR(ZICNTR),
@@ -201,6 +202,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_ZFA:
 	case KVM_RISCV_ISA_EXT_ZFH:
 	case KVM_RISCV_ISA_EXT_ZFHMIN:
+	case KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_RISCV_ISA_EXT_ZICCRSE:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICOND:
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
