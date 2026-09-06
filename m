Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1559EC79F85
	for <kvm-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m9dOf6bemW+TctYjWSyl/2RpmExzzz2LLfuUVO66cp0=; b=oKRH6Xlor5z1yQ
	bmUNfrHQUCdmJIfA7wv5dgdvNW3nNO+8mNco2ggVLRXQXWJYVSOhfhIESjMmpqbLWpaZoIrVJNNB8
	WlrzqH4zxDnvqCbeAeZG0h7lMf/RbO8JuMcTjLU9atbAdJH2w1sYv+J2dMpEyDhOSwN9a6UJJ7ujP
	RJMiir97Ky/ZlT2zPGNJM27bh243jJMitGZfqaVYXdVswsfNp9CO8sRWYMqNuEzP9MmzAPHaMdO3H
	hdl+t6zWvjGDR+Xg/ldLBflWefdAuJbAMebfrSmsEulSuDha2Aow/hRLCONfEiLV7ixS7NaAGtI2e
	T2u+cX74hnm2LzTqwWVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37vD-00000004pgU-25m1;
	Sun, 06 Sep 2026 08:08:15 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37v9-00000004pg5-3x6r;
	Sun, 06 Sep 2026 08:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=H//yKEWH7uGYDzEIgQa88pwd64vRhIeJuk+RkZvLUtI=;
	b=lA/dXTTFCjPe65etT7koqz9kRmupLUgpvW6BXTuY/YxmF+W8aFViggbL/4KEQ2
	mmecpRDNAhbObe4NvO4FmbqC+EFd1mI8suFdthRK176zJ66DcEU7UdA6L9h8UBKF
	RDJAxV/dtg60JJTHfu50BDvTnVaROnRbsvFRN3/cTvCQA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDn7zMxH51qMxYMBA--.25025S2;
	Sun, 06 Sep 2026 16:07:14 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Subject: [PATCH] RISC-V: KVM: Publish NACL HFENCE configuration last
Date: Sun,  6 Sep 2026 16:07:11 +0800
Message-ID: <caplitmus-rv.c91c005b844342d9a9f60949b04c520d.d65@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDn7zMxH51qMxYMBA--.25025S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF1xXw13uw15urW8KFyDJrb_yoW8AFWxpF
	ZakrWrKr1akr1fK3s0v393uryrWan5uFW7J39xuayjvwnxZ3WrX34vqrWUZa45GF4kZa1I
	9ryY9FWjkFy5JwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRdhLbUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhLVnmqdHzIH7QAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_010812_678413_BCB0FA6F 
X-CRM114-Status: UNSURE (   7.83  )
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

The SBI NACL interface requires software to write Page_Number and
Page_Count before publishing an HFENCE entry with Config.Pending set.
__kvm_riscv_nacl_hfence() currently stores the pending configuration first.

Write the payload first and order those stores before publishing the
configuration word with WRITE_ONCE(). Use a write barrier that also
applies to UP kernels, since the consumer is outside the Linux SMP
domain.

Keep nacl_hfence_mkconfig() unchanged: setting Pending in a local value
does not publish the entry. The shared-memory store is the publication
point.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: d466c19cead5 ("RISC-V: KVM: Add common nested acceleration support")
Assisted-by: GPT-5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---

diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
index 9aff03c4..c5c4907a 100644
--- a/arch/riscv/kvm/nacl.c
+++ b/arch/riscv/kvm/nacl.c
@@ -5,6 +5,7 @@
 
 #include <linux/kvm_host.h>
 #include <linux/vmalloc.h>
+#include <asm/barrier.h>
 #include <asm/kvm_nacl.h>
 
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_nacl_available);
@@ -42,12 +43,15 @@ again:
 		}
 	}
 
-	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
-	*entp = cpu_to_lelong(control);
 	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PNUM(i);
 	*entp = cpu_to_lelong(page_num);
 	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_PCOUNT(i);
 	*entp = cpu_to_lelong(page_count);
+
+	/* Publish the payload before setting Config.Pending. */
+	wmb();
+	entp = shmem + SBI_NACL_SHMEM_HFENCE_ENTRY_CONFIG(i);
+	WRITE_ONCE(*entp, cpu_to_lelong(control));
 }
 
 int kvm_riscv_nacl_enable(void)

base-commit: 4d7d9486c04d917265f64c55bd23b2cc4fe7749c


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
