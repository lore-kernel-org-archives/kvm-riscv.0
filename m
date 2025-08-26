Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56B8CA0FF7
	for <kvm-riscv@archiver.kernel.org>; Tue, 26 Aug 2025 16:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Esax5xpS5s3GGxuhioVMbRDH5NyNm0U1bcIlaeqA/Mg=; b=vOVfpdIukWO0OI
	MdmOHkC6QD9OpRcsHPAtgjEDOcYZ3d7H7WCMjsuCTkuqquHNK/8/A5WvI2gAOePJKHLKSjW5AK0bG
	K+jGfSI5N/i6iK7JKVnZgx1Vj/GRih+UGid3UtUQLi4WcyyWQPsF7paYVNuK2AVGxXeAXCAOfwrwI
	vz9U/2suemXwx6Lm4Bio6IJ1gqHAdPkR1zRa47A10IHO/t71d84deMpt/azc4YBfunF5sSgUe62ds
	02ht905xEMLLBl5/RdoVVEWuf2sNHSEgzHfTMo2yBDKKgbhzww9dcr/Uu9iSaU698CjX8gdps5ils
	QyvjuAKhKrFejxE07GCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwZF-0000000Ce9W-2SPd;
	Tue, 26 Aug 2025 16:30:41 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwZB-0000000Ce3P-0JmU;
	Tue, 26 Aug 2025 16:30:38 +0000
Received: from ROG.lan (unknown [118.251.176.199])
	by APP-03 (Coremail) with SMTP id rQCowAD3jX8L4a1oBKJmDw--.6398S6;
	Wed, 27 Aug 2025 00:30:25 +0800 (CST)
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
Subject: [PATCH v2 4/5] riscv: KVM: allow Zilsd and Zclsd extensions for Guest/VM
Date: Wed, 27 Aug 2025 00:29:38 +0800
Message-Id: <20250826162939.1494021-5-pincheng.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowAD3jX8L4a1oBKJmDw--.6398S6
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4ruw45tFyDtrWUCrWUCFg_yoW8Wr17pr
	s8CF9I9rW5C34fuas7twn8ur18Ww4UWws0ka1xur4xJFyUCry8JF1DA3W3Zr1DJay09rn5
	WF1fGr18Zw45Ar7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_
	Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x
	IIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_
	Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8c
	xan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCj
	c4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr
	0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	YxBIdaVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-Originating-IP: [118.251.176.199]
X-CM-SenderInfo: pslquxhhqjh1xofwqxxvufhxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_093037_474307_BE26BB52 
X-CRM114-Status: UNSURE (   7.07  )
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
