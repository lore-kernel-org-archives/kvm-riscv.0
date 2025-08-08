Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E57CA0EC0
	for <kvm-riscv@archiver.kernel.org>; Fri,  8 Aug 2025 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXQ1asMvLdciIlDccIF8GyRsu4eFGw8aEUeyWab6pf4=; b=3CKaVoSD6E3ZqP
	I0yRB+NtTZwquGw+H4cvfUPyP4t5ShLC2p/WhjuesXe53FMUrIOo3wnhdkB41OiOt+5qfr95u9Vxj
	NAV8y5OZ+sSxaL7qLeeMxKT/yPrJy8vSsZ/x+Rrbh/I+qZr2kGxj0jsD215aKKJNJw9RL38CnvrLp
	dwBTwWJ5yhL8coihUj1mdo+s8hNkNj/E8eu8cBnKnCg0L4E+9QZTDLJoiVXVF0kzBANloKhB1WWk1
	RWXYpue4yUZqFVJmIIhgmmBhy5mkb0EstlYsJ+p+mYkDFp7TVn3TlI48zeIXsI7z3XPCb0pNWwLNR
	nv18apOsfzy9ZeDtiRdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKcZ-00000002auh-04Sw;
	Fri, 08 Aug 2025 10:46:47 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukKMm-00000002Z4A-1XJ4;
	Fri, 08 Aug 2025 10:30:29 +0000
Received: from zq-Legion-Y7000.. (unknown [121.237.92.164])
	by APP-03 (Coremail) with SMTP id rQCowACnPX+f0ZVo0RdQCg--.29185S2;
	Fri, 08 Aug 2025 18:29:52 +0800 (CST)
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
Subject: [PATCH v2 1/6] RISC-V: KVM: Change zicbom/zicboz block size to depend on the host isa
Date: Fri,  8 Aug 2025 18:18:21 +0800
Message-Id: <fef5907425455ecd41b224e0093f1b6bc4067138.1754646071.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1754646071.git.zhouquan@iscas.ac.cn>
References: <cover.1754646071.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACnPX+f0ZVo0RdQCg--.29185S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy8Wr13Xr13Ar13KF4DJwb_yoW5Jr43pr
	43CrWF9Fy8AFy2qrZ7JrWkWFn5uw1qgrs5Gw4kWa48Zry7trWrGrnYkryUAFn2yFyfZrs2
	93Wvkryj9Fs8Ka7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4DMx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbfWFUUUUUU==
X-Originating-IP: [121.237.92.164]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBg0IBmiVokWUdwAAs8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_033028_773942_F09DB611 
X-CRM114-Status: UNSURE (   9.45  )
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

The zicbom/zicboz block size registers should depend on the host's isa,
the reason is that we otherwise create an ioctl order dependency on the VMM.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu_onereg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea54f..6bd64ae17b80 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -277,12 +277,12 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
+		if (!riscv_isa_extension_available(NULL, ZICBOM))
 			return -ENOENT;
 		reg_val = riscv_cbom_block_size;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+		if (!riscv_isa_extension_available(NULL, ZICBOZ))
 			return -ENOENT;
 		reg_val = riscv_cboz_block_size;
 		break;
@@ -366,13 +366,13 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 		}
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
-		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
+		if (!riscv_isa_extension_available(NULL, ZICBOM))
 			return -ENOENT;
 		if (reg_val != riscv_cbom_block_size)
 			return -EINVAL;
 		break;
 	case KVM_REG_RISCV_CONFIG_REG(zicboz_block_size):
-		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+		if (!riscv_isa_extension_available(NULL, ZICBOZ))
 			return -ENOENT;
 		if (reg_val != riscv_cboz_block_size)
 			return -EINVAL;
@@ -817,10 +817,10 @@ static int copy_config_reg_indices(const struct kvm_vcpu *vcpu,
 		 * was not available.
 		 */
 		if (i == KVM_REG_RISCV_CONFIG_REG(zicbom_block_size) &&
-			!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
+			!riscv_isa_extension_available(NULL, ZICBOM))
 			continue;
 		else if (i == KVM_REG_RISCV_CONFIG_REG(zicboz_block_size) &&
-			!riscv_isa_extension_available(vcpu->arch.isa, ZICBOZ))
+			!riscv_isa_extension_available(NULL, ZICBOZ))
 			continue;
 
 		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
