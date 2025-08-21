Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64761CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Esax5xpS5s3GGxuhioVMbRDH5NyNm0U1bcIlaeqA/Mg=; b=aHL5bQUKtfRoSZ
	KZDeH/9TVxzzK0ZHACoPhfXGhPRvHeFgCrVvyyxe/MlgKJzvVSy+NFrXfMUFpALuKRQ/qjQddOiFs
	N/wAeA87mBYD8XJF5QSabf5dDCMUtQznqU04DYTYEh5TMRHs1YVN9PlqdY9dHDBQyUEFmg84tisLc
	TD5FLwmyfCYxbinR2NnUJyIZTNqfHDDQq68Phu21Me/sc3jLejkF5f8PokFkSllROC0gmSRq+auyH
	3k3naZFh6kpooAn79lFweCQlGjFfQ4tKYJiXRz2xQneFP5p/OKsI1acHc06dAAa763Ad67HFZbjYr
	evndFVDCNwd2brKAPL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAiR-00000000FWd-38qp;
	Thu, 21 Aug 2025 19:12:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5re-0000000H9fA-3JG7;
	Thu, 21 Aug 2025 14:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rTW1kP7aTYTeLALjYkGd/oQheoOm8IA693rfkJNd5rI=; b=NovpS5d3R6JvXlJ8P7GUkiYkuT
	en8FWlDYchk/CzA4PwPSWDMo0LDirAME/2Rpv6Ms9ap9CE76awWihakg6UiTmy1E7IRJkvz9jtNsq
	W92zzgdu0MFp7UNJk4dXAqZ0jJaNjji83QwiTS+DzBkxVkxTxv9pgOLncRtPSiYp9/SuIotKzWaCa
	Pk0theydKUiDayOQGQK0zLUhY7DYH/Tb+yIYAmMPzVuT8+Me22msbOq96vedM98n295fyBxr2Dspq
	PXaG0NT/o+Etax1hvqn3ErhmMY85Xgro7lcUtQGVE0j2qBVpO7XEZD5Hqu7IFQ4ZM7a1tQvYErcei
	7aah6AKA==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5rb-00000000aM4-2Fbk;
	Thu, 21 Aug 2025 14:02:01 +0000
Received: from ROG.lan (unknown [118.251.176.166])
	by APP-03 (Coremail) with SMTP id rQCowABn+Xq+JqdoP8MTDg--.22469S6;
	Thu, 21 Aug 2025 22:01:46 +0800 (CST)
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
Subject: [PATCH v1 RESEND 4/5] riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
Date: Thu, 21 Aug 2025 22:01:30 +0800
Message-Id: <20250821140131.225756-5-pincheng.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
References: <20250821140131.225756-1-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABn+Xq+JqdoP8MTDg--.22469S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ruw45tFyDtrWUCrWUCFg_yoW8Wr17pr
	s8CF9I9rW5C34fuas7twn8ur18Ww4UWws0ka1xur4xJFyUCry8JF1DA3W3Zr1DJay09rn5
	WF1fGr18Zw45Ar7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUml14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUWVWUuwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j
	6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x0262
	8vn2kIc2xKxwCY1x0262kKe7AKxVWrXVW3AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE
	7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_
	Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JbIYCTnIWIevJa73UjIFyTuYvjTRZGYpUUUUU
X-Originating-IP: [118.251.176.166]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_150200_125584_36D42239 
X-CRM114-Status: UNSURE (   7.21  )
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

Extend the KVM ISA extension ONE_REG interface to allow KVM user space
to detect and enable Zilsd and Zclsd extensions for Guest/VM.

Signed-off-by: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 5f59fd226cc5..beb7ce06dce8 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -174,6 +174,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCD,
 	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_ZCMOP,
+	KVM_RISCV_ISA_EXT_ZCLSD,
+	KVM_RISCV_ISA_EXT_ZILSD,
 	KVM_RISCV_ISA_EXT_ZAWRS,
 	KVM_RISCV_ISA_EXT_SMNPM,
 	KVM_RISCV_ISA_EXT_SSNPM,
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 2e1b646f0d61..8219769fc4a1 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -64,6 +64,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZCD),
 	KVM_ISA_EXT_ARR(ZCF),
 	KVM_ISA_EXT_ARR(ZCMOP),
+	KVM_ISA_EXT_ARR(ZCLSD),
 	KVM_ISA_EXT_ARR(ZFA),
 	KVM_ISA_EXT_ARR(ZFH),
 	KVM_ISA_EXT_ARR(ZFHMIN),
@@ -78,6 +79,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
 	KVM_ISA_EXT_ARR(ZIMOP),
+	KVM_ISA_EXT_ARR(ZILSD),
 	KVM_ISA_EXT_ARR(ZKND),
 	KVM_ISA_EXT_ARR(ZKNE),
 	KVM_ISA_EXT_ARR(ZKNH),
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
