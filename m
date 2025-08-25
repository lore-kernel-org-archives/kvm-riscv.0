Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0EFC8303F
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 20:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCtrYW47lI3NzMM6i25jvTowhA6ZuymRJMu5TxzWll0=; b=QHq9n9rlott7w4
	a8PzEZ5lFFQzLcZ772ujIFnMaaT2EzkmYAHi01He7FuTDCrMRvbjzMx8VQKTk4PzhVcu4yKrdMhrd
	QbuzYVR5T2cLYL8CEa5Ol1Dei9luLdKsY0AP2+ygBkCzI1C2hoCzvSScgjCuN5g5ZPidvNWrXzvJ6
	nokomwECLl9M35GZHdeRKrIVKtCi8MNMCmr9Ui60xTOoZjX0hrjdpV2l4U41dU5Z+ccYwWNb5zeGD
	LbRZ7CoYvD/mhO9NThigeJ+KLRsQyzlV0J5C4glFXuLUNPTcy+iDwRXaN7Z5Oa3Bhzi8LqmkVTmx/
	RcfPyjtZrfShCSkX7owQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdYy-00000009WYO-2YwJ;
	Mon, 25 Aug 2025 20:13:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSa-00000009UrL-2eUV
	for kvm-riscv@bombadil.infradead.org;
	Mon, 25 Aug 2025 20:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n6KAJgpe+g35DHpdkouiNXTkH/lGhIRNqTvdrNu3evo=; b=RKByuoRu248XuiUlOgkpE9Z/i0
	9SjVR9+uRwXzv9SzzhG3oGr0SP/O4qitcNAGh7ODWSgUFWvIyOS1NPQZJ5lRBaNqgU06t4xJGtkbU
	A9BmxOOgL/cS9d1bluQC50NAHseofVxXHZaR4bPa0CFPEwy4Er/WKVrmHa4aBcE6uYvcjWEFoKJ2y
	gQLW1q5eObc9mDpACvJzhk8zXkZEffZ9C4FqsRU/YNJcsoM080LXkE084w3U0gyeMKPJqvNY/oXUj
	/H7KT4uz4SRAkK33ebMq1jqi1G2wpu2jduly7I+oZVpVjEN7kDBH5bZfjbkl5Jl0IsVOvJmi9nkr6
	PMSNbTKQ==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSX-000000021uC-2rYO
	for kvm-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:31 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b49c4e7ba85so1528262a12.3
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152387; x=1756757187; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n6KAJgpe+g35DHpdkouiNXTkH/lGhIRNqTvdrNu3evo=;
        b=HNFfglC5ZJDY0CHIJXtFj9QSU4kEkAnNTerNsplmzP9TTkXD1d+WNBT9gVprCnEDNR
         fDJTkqLBFvq5RrbQZlCHaOiVEhWZG78iXlITcOFqthk3pY7l+Xz0AkVDJutWo21L7WOi
         vBpaiNE79N+85I86or4rNeFL8un/gAcQpUSJa1p4DsThlOvdgr0ze7Om2Go8gLw3Ykwu
         ik6G79XrHzVU+eltN6uwK2+f5vmFuH5lMxRINxaa/YL4tJOZu3JNGwCyB/SH66nMOfY/
         YbWlykrj/w1I3rXsn1vZGPAdCUBpVIZ8DWAWWGD1wPwSVdjWWznRDMIE5o/waRadBdFG
         lIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152387; x=1756757187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6KAJgpe+g35DHpdkouiNXTkH/lGhIRNqTvdrNu3evo=;
        b=s9PqfLq0I2Lyd3V+jVSssTpTkYgiEaQp+mN1ouVwKbryrRYSRjvHfDEczxboHDKjkp
         3Pu6DWDrGmZyNfUn+4XT+9oemJhxS6+yxbMax2VfwFL4VkOd7v/OH2QGZYc4P/B21ZpY
         UiNuheAQao5JOdkFv59g2JJlLchjWD8huSALQnN6WzO+KnjeYE5MLoxdHncAnB09t2ND
         328zmb3kBBRoXwvfMPgv35d/ObCGmNu80Iu9PDTzKDNZZjXBGWCnmTsp3PVr4X6P14+Z
         cF0K4YQ1HWtkwSZHUrdHD50Y7AfVoxXKmVTtIolwl72AMyM+54S4s918i8rmg2p0syq9
         kJSw==
X-Forwarded-Encrypted: i=1; AJvYcCVKdtn4zmxRYryhA2weUgQ8sSBl+rNJVQPz3J52wfFMYTD40Fuqpdx6SoSqDvKKH9NiGNuccKO2fAY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYGJfYENAe0SX6ebCTHtsriOy5YTx2KFCscZnRbQ12+SzszUwi
	8va4+Hg6CM4dqDKQajUnOGNTIXiLlhP8t7QpGeLd3ReZybDsMRU3hjsuSA3u6FexK52l+/Huyhr
	Yl/AL3A==
X-Google-Smtp-Source: AGHT+IF91dn1j6fIvX+uRWorld3If0wpZl5jf5hDJFPUly2WnQsNSAnJfoCi7L3EWOQImM7m2slTmOJmyMA=
X-Received: from pjbok14.prod.google.com ([2002:a17:90b:1d4e:b0:325:8fba:708c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc4b:b0:246:76ed:e25d
 with SMTP id d9443c01a7336-24676edecf2mr117886095ad.50.1756152387296; Mon, 25
 Aug 2025 13:06:27 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:18 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-2-seanjc@google.com>
Subject: [PATCH 1/5] Drivers: hv: Move TIF pre-guest work handling fully into mshv_common.c
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_210629_912705_6C50CE4F 
X-CRM114-Status: GOOD (  16.28  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Move the root partition's handling of pending thread work fully into
mshv_common.c so that the "work pending" and "do work" code is co-located.
Splitting the flags-to-check logic makes the code unnnecessarily difficult
to maintain, e.g. it would be all too easy to add a check in "do work" but
not in "work pending", and vice versa.

Note, this adds an extra CALL+RET when no work is pending; that will be
remedied in the near feature by switching to common virtualization entry
APIs.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv.h           |  2 +-
 drivers/hv/mshv_common.c    | 24 +++++++++++++++++++++++-
 drivers/hv/mshv_root_main.c | 24 +-----------------------
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/hv/mshv.h b/drivers/hv/mshv.h
index 0340a67acd0a..db3aa3831c43 100644
--- a/drivers/hv/mshv.h
+++ b/drivers/hv/mshv.h
@@ -25,6 +25,6 @@ int hv_call_set_vp_registers(u32 vp_index, u64 partition_id, u16 count,
 int hv_call_get_partition_property(u64 partition_id, u64 property_code,
 				   u64 *property_value);
 
-int mshv_do_pre_guest_mode_work(ulong th_flags);
+int mshv_do_pre_guest_mode_work(void);
 
 #endif /* _MSHV_H */
diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index 6f227a8a5af7..1acc47c4be0d 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -146,7 +146,7 @@ EXPORT_SYMBOL_GPL(hv_call_get_partition_property);
  *
  * Returns: 0 on success, -errno on error.
  */
-int mshv_do_pre_guest_mode_work(ulong th_flags)
+static int __mshv_do_pre_guest_mode_work(ulong th_flags)
 {
 	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		return -EINTR;
@@ -159,4 +159,26 @@ int mshv_do_pre_guest_mode_work(ulong th_flags)
 
 	return 0;
 }
+
+int mshv_do_pre_guest_mode_work(void)
+{
+	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
+				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
+	ulong th_flags;
+
+	th_flags = read_thread_flags();
+	while (th_flags & work_flags) {
+		int ret;
+
+		/* nb: following will call schedule */
+		ret = __mshv_do_pre_guest_mode_work(th_flags);
+		if (ret)
+			return ret;
+
+		th_flags = read_thread_flags();
+	}
+
+	return 0;
+
+}
 EXPORT_SYMBOL_GPL(mshv_do_pre_guest_mode_work);
diff --git a/drivers/hv/mshv_root_main.c b/drivers/hv/mshv_root_main.c
index 72df774e410a..6f677fb93af0 100644
--- a/drivers/hv/mshv_root_main.c
+++ b/drivers/hv/mshv_root_main.c
@@ -487,28 +487,6 @@ mshv_vp_wait_for_hv_kick(struct mshv_vp *vp)
 	return 0;
 }
 
-static int mshv_pre_guest_mode_work(struct mshv_vp *vp)
-{
-	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
-	ulong th_flags;
-
-	th_flags = read_thread_flags();
-	while (th_flags & work_flags) {
-		int ret;
-
-		/* nb: following will call schedule */
-		ret = mshv_do_pre_guest_mode_work(th_flags);
-
-		if (ret)
-			return ret;
-
-		th_flags = read_thread_flags();
-	}
-
-	return 0;
-}
-
 /* Must be called with interrupts enabled */
 static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 {
@@ -529,7 +507,7 @@ static long mshv_run_vp_with_root_scheduler(struct mshv_vp *vp)
 		u32 flags = 0;
 		struct hv_output_dispatch_vp output;
 
-		ret = mshv_pre_guest_mode_work(vp);
+		ret = mshv_do_pre_guest_mode_work();
 		if (ret)
 			break;
 
-- 
2.51.0.261.g7ce5a0a67e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
