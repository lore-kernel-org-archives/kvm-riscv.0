Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE862CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=noPQqaO2dTWbmfbGBlTuqJ2NONUWVNnSxhx+n7SWdo8=; b=Z+VcVgrhc7ggTO
	KWBdmCpLsEIQ+a8tr7XY9atTfZudN9fdZHUL26IBBa1epYACAjdAmCtwYDjizWzaQlWF0SHi+XrF/
	F9xtfGRczTsfNFOtLpsQQWa//GnM2RzTw893YHYosKZBhv9/g4jYnZshRrAKNsg/yBmGkm4tlogzC
	9xSpfGYNbPcQ8Yr/e9CuKtT0/N87zPgfJ6YWu8LsTgydU6bKgVL4Oc/zh/sX2fX3CwqBvbwpPmVV/
	+zNYB56ZD2KAFaRE/gbARa6BzXlbti6T2mPiD2IY80dTteltr8h2ku/0VXpxXbeiVo+6EYGC7dFvX
	p2aNQsCaksnTxCBek+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAiH-00000000FGI-1Mvd;
	Thu, 21 Aug 2025 19:12:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5rY-0000000H9da-2w41;
	Thu, 21 Aug 2025 14:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WypYg8Di5+ctYuuvL+iWdAt2OFaiOtRitTcw3epFaMk=; b=nFmrt8S4n6AMGAIijfmdiUe/93
	Bv9NZWloFN7R/UR0I4GqUxVkgRCLfpo9SrYO2PodN9WmcuD05Wdq2D/eGfHii/V/f8zc9ZxRYpmd9
	9PzN20k12mkclLgUMeZAIZsHhQlh4u85nq1vgvxaSpPr/7B/iOEjoy5VdN5bkOXpQDopcNOaevbTz
	AnmoEZTlePZ/ZJPdRyT1NZQNrRsMxeALjZKoQkTxCJCyLJdGkjtcli2xuhTKWKxzP+mBFH+Df6LZl
	Bi7BCoJOYRqPXnu41uoIbcx1iiqKRU4f/wvnJjLjMt+xQ9v9lie36aXs0tBrFBuTNsRH3JGSof4tF
	gLh1nGCQ==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5rV-00000000aLX-0vVL;
	Thu, 21 Aug 2025 14:01:55 +0000
Received: from ROG.lan (unknown [118.251.176.166])
	by APP-03 (Coremail) with SMTP id rQCowABn+Xq+JqdoP8MTDg--.22469S4;
	Thu, 21 Aug 2025 22:01:41 +0800 (CST)
From: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	anup@brainfault.org,
	pbonzini@redhat.com,
	shuah@kernel.org,
	cyan.yang@sifive.com,
	cleger@rivosinc.com,
	charlie@rivosinc.com,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	namcao@linutronix.de,
	jesse@rivosinc.com,
	inochiama@gmail.com,
	yongxuan.wang@sifive.com,
	ajones@ventanamicro.com,
	parri.andrea@gmail.com,
	mikisabate@gmail.com,
	yikming2222@gmail.com,
	thomas.weissschuh@linutronix.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	pincheng.plct@isrc.iscas.ac.cn
Subject: [PATCH v1 RESEND 2/5] riscv: add ISA extension parsing for Zilsd and Zclsd
Date: Thu, 21 Aug 2025 22:01:28 +0800
Message-Id: <20250821140131.225756-3-pincheng.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABn+Xq+JqdoP8MTDg--.22469S4
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1rAF1kuFW3Jr15ArykAFb_yoW5GF4kpr
	s5CrWFyrWDJw1fuwsxtrZ5Ww15Xw1UGws8Gw1xWryrJFW7trWfXr1kAa42yanxJFy0qr1Y
	vF1rWrsxZa4UAa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjTRu1vVUUUUU
X-Originating-IP: [118.251.176.166]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_150153_757385_963A23BC 
X-CRM114-Status: UNSURE (   9.95  )
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

Add parsing for Zilsd and Zclsd ISA extensions which were ratified in
commit f88abf1 ("Integrating load/store pair for RV32 with the
main manual") of the riscv-isa-manual.

Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
---
 arch/riscv/include/asm/hwcap.h |  2 ++
 arch/riscv/kernel/cpufeature.c | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7ad43d12c49f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZILSD		100
+#define RISCV_ISA_EXT_ZCLSD     101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572..8e7757db3895 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -242,6 +242,28 @@ static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zilsd_validate(const struct riscv_isa_ext_data *data,
+		  const unsigned long *isa_bitmap)
+{
+	if (IS_ENABLED(CONFIG_64BIT))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_ext_zclsd_validate(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	if (IS_ENABLED(CONFIG_64BIT))
+		return -EINVAL;
+
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZILSD) &&
+		__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_vector_f_validate(const struct riscv_isa_ext_data *data,
 				   const unsigned long *isa_bitmap)
 {
@@ -483,6 +505,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcd, RISCV_ISA_EXT_ZCD, riscv_ext_zcd_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcf, RISCV_ISA_EXT_ZCF, riscv_ext_zcf_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zcmop, RISCV_ISA_EXT_ZCMOP, riscv_ext_zca_depends),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zclsd, RISCV_ISA_EXT_ZCLSD, riscv_ext_zclsd_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zilsd, RISCV_ISA_EXT_ZILSD, riscv_ext_zilsd_validate),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
