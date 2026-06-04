Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AF9CD6E4A
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMP+G+T1prqwvsaIiKHPRvfkiqYQkXvi4x/S0CBBaMA=; b=UGR/XgVAueh2Up
	jwdR0vDdlIBHoXGy4jHXy3WQF4DgDf6DP8c7Z1DZyaCGBBU36DnOH5ZE4s8v4jHKgUOPFBX1ZLJ5g
	/ZA1uX8EsJWOOlsLru5+XGUvx3Re5uDvFOtRHd/vV+AU3FG9YqWpT2CAyQYY0yNNS/fKHJnTWpj8D
	eZwALJlFhnIaOVR3SsM36un4TYAZCYGceos2Ks74Lz4tIK9AI9AhuozlgdmK6s7bQIR9N2bjfFdqt
	nPntTYGQaMVvVcsDrYHMqg4BtvPh5JFM5+XCAkF4+24O84Xdhe+ryIIUamXO/RrinDMVULvVXWm+0
	3h2zlDbfnwR6eCID0avQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV83t-0000000GmDx-1Okd;
	Thu, 04 Jun 2026 13:24:41 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV83p-0000000GmAY-1cMO;
	Thu, 04 Jun 2026 13:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780579466; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=/yMhiuP+Blm+ANy4YIKSZBeqw55+G0nlxi+JWHCA5d8=;
	b=S8zh3jHOwUiHsWACoJKv6JVNLtLsvCrJhu7d8rU5vx/KF3zGLtb1Nh/hf6/HYTJmmzWegcdwPEau4KHnNF3l1Xxyhj+9K3FduVHeyyfmU6dueM48fHSNdOk3/ywVcZ0Iit+2ojKOwysy2GBLUO+DEo08Pa3Uz/zg0hwt/OWsYRg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=24;SR=0;TI=SMTPD_---0X4AKnWu_1780579463;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X4AKnWu_1780579463 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 04 Jun 2026 21:24:24 +0800
From: fangyu.yu@linux.alibaba.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Nick Kossifidis <mick@ics.forth.gr>
Cc: Song Shuai <songshuaishuai@tinylab.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Richard Lyu <richard.lyu@suse.com>,
	Nam Cao <namcao@linutronix.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	guoren@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 1/9] riscv: kexec: Reset executable bit on the control code page in cleanup
Date: Thu,  4 Jun 2026 21:24:10 +0800
Message-Id: <20260604132418.15725-2-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260604132418.15725-1-fangyu.yu@linux.alibaba.com>
References: <20260604132418.15725-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_062437_999894_22A1CE3B 
X-CRM114-Status: GOOD (  11.94  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

machine_kexec_prepare() calls set_memory_x() on the per-image
control_code_page so the relocate stub copied into it can be executed
during a normal kexec. machine_kexec_cleanup() is empty, so when the
image is freed (via kexec -u, or because a later step in load failed)
the page is returned to the buddy allocator with its executable bit
still set. Once the page is reallocated for arbitrary kernel data,
the W^X invariant is broken: a writable page also marked executable.

Implement the architecture cleanup hook to call set_memory_nx() on
the control code page for non-crash images, mirroring the
set_memory_x() in prepare().

The crash path does not call set_memory_x() (the crash kernel is
loaded into the reserved crashkernel region whose pages are not in
the buddy allocator) and so does not need the cleanup.

Fixes: fba8a8674f68 ("RISC-V: Add kexec support")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kernel/machine_kexec.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 2306ce3e5f22..ea6794c9f4c2 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -91,6 +91,19 @@ machine_kexec_prepare(struct kimage *image)
 void
 machine_kexec_cleanup(struct kimage *image)
 {
+	void *control_code_buffer;
+
+	if (image->type == KEXEC_TYPE_CRASH || !image->control_code_page)
+		return;
+
+	/*
+	 * machine_kexec_prepare() called set_memory_x() on the control
+	 * code page for non-crash images. Revert it before kimage_free()
+	 * returns the page to the buddy allocator, so we do not leak an
+	 * executable page back into general allocation.
+	 */
+	control_code_buffer = page_address(image->control_code_page);
+	set_memory_nx((unsigned long)control_code_buffer, 1);
 }
 
 
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
