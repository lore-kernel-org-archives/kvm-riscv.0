Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1014BCD37B6
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 09:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DQ1M4x7QrVhqM8Oep2qtLDwCS6agIA//7hhy1vyl+Gc=; b=ss1J4Qa13pNo9K
	S427z1EA8bKo3IztwS/ZM+Us+RXpJHK1inTaD5gp6p6fCCWUJ6P4hAR5kv0+h5iHGByJq9ArmahAj
	+vTBBu/ZOZiGino8tOZrlf5TTrPZqpr76n5P3lQUOTHuKNdqL700fUkhBNaMFy8+YPLOFtpxTjGoO
	wIXJkSdjIuyeEAMb0p43Iaabz7lULSFLdbePLhnYxaRlQAWyLlry8lYTiJj1bLGLW7qqXRf0hQwcr
	z+MaFtm03ZCQ+PGeI9UUPox8YDTv1P6t5v5LAgc43eOCQZ0tM5uWl78ZbeBevB/ZfGGVQJVyGaV2f
	emZMA0kVsZxKOLv1q7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5sn-00000001v89-1zv0;
	Wed, 13 May 2026 09:28:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5sm-00000001v7p-2tqa;
	Wed, 13 May 2026 09:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aqNpbXi0KnY7gEyGAKvU25B0unSXfcgvzQFeEwn9qQI=; b=izYxfGET4e79MLwuqgO8UC/SO+
	8nEQGnxETpkgwbdNV4xj4n1FX3XgU4TQ4dXyawrLssG76a//WYBevyANAe3DUsbnqV9AuSLvDr/xu
	HcY7oTz/Wf9TaOnBXW6telhxujWpTT5uDQoSioPyeuMKIMY9RTZ0KwhEvJKyP27cuemJjC+EMEJV7
	/RmgLObc7jU4GiSKLm1UKJNkDLvrjs5L/gd94Lu2G5tSjr+Rhq1TjNXhoQBkBV3mYK1S0yjaJ7Eqb
	gmx418ZC4J+6IIUUFjRKeaUi2Yu2GuxVr0wD9+qMRaLRd5RYog8gA7ogLUWP/ub3cFUgT7CiJHQ26
	GfY8RFVQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5sX-0000000GzlS-1O2g;
	Wed, 13 May 2026 09:27:58 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowAAXqQzbQwRqYzYkEA--.50008S2;
	Wed, 13 May 2026 17:26:52 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
Date: Wed, 13 May 2026 09:26:50 +0000
Message-Id: <20260513092650.2386205-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXqQzbQwRqYzYkEA--.50008S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Aw48WF1xtryUCF1fAFW3Awb_yoW8Gr45pr
	WDCFnagFWrJFWUC3W8trsYkF4jyrs5Krn5tr4kC3yrurWYqF1rZw4DK347XryUuFWjqF1S
	9r4jgF95uFs5ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbknY7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRAGCWoEBxLpaQAAst
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_102746_382375_A06A279D 
X-CRM114-Status: UNSURE (   8.18  )
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

The SBI v0.1 SEND_IPI handler iterates over the hart mask and calls
kvm_get_vcpu_by_id() to find the target vcpu for each set bit. When a
guest provides a hart mask containing bits for non-existent vcpu_ids,
kvm_get_vcpu_by_id() returns NULL, which is then unconditionally
dereferenced by kvm_riscv_vcpu_set_interrupt(), causing a kernel crash.

Fix this by adding a NULL check before dereferencing the return value.
If the target vcpu is not found, skip it and break out of the loop.

Fixes: a046c2d8578c ("RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Assisted-by: OpenClaw:DeepSeek-V3.2
---
 arch/riscv/kvm/vcpu_sbi_v01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
index 188d5ea5b3b85..98ecfcb2469e6 100644
--- a/arch/riscv/kvm/vcpu_sbi_v01.c
+++ b/arch/riscv/kvm/vcpu_sbi_v01.c
@@ -55,6 +55,8 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 		for_each_set_bit(i, &hmask, BITS_PER_LONG) {
 			rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
+			if (!rvcpu)
+				break;
 			ret = kvm_riscv_vcpu_set_interrupt(rvcpu, IRQ_VS_SOFT);
 			if (ret < 0)
 				break;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
