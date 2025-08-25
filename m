Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C91FCA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+lm60hzPQZ5FI5oV1QMWcBNbInb7ErTe/6mhyXC+SRg=; b=KtV6nO0IF+aI3J
	CmeiG7W36I7Lys9vXXCZqQLTwsvIviOt+dMD9GReGDtIbttWyVmD4jUbL/U15pUFUjsJ+hvfpDC+/
	AT6GSM0Ey3q3yKny9jH0l/a2Zk1bodG+YIsWccY0XyvgkNmDZtT0t4pzT0Zq08l6Tc+i0Fn/NptFS
	p8OP8x9/xUszgIeJ27UEZZcM+z6c3ZPIKbxuaaT2Jf9/K/hRtnnUvF+/IxHBBTgKhU7ZPKKQxKmGx
	63Psc9NrqEo/Ngbej/9gTadkRwtrRh9/Oj6Mi4GAXYCOYSSnrYaSRjiceCdhglKs66KFtCJ31XrXK
	MXgrJ6/hMKfxhtn0Ua1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdbg-00000009XF1-3xUJ;
	Mon, 25 Aug 2025 20:15:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSc-00000009UsZ-0ewZ
	for kvm-riscv@bombadil.infradead.org;
	Mon, 25 Aug 2025 20:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=; b=E7DzcDAK4qID2b1tMQb9K3JxdM
	iRHw+fDUDZYG7t/99DHEgTsHaVNxPFl3zYHCYlIEXBwg6ahR1PivBpXWw+8Dj9U0XMg3u3olGxCXu
	Xw4rFE4zHwpfhU4TtZKphJ0pcFJ/526V+31vP1MPwOP8Pykd4KfT6UOtDiIi1TwbHCXKNj3EyETfg
	xWkvkH2Kw3c7OzbtM6QQFBTGtDdoFwZSjwYaIqxhIJ4mUsA2NDzkQQNPYKpCl0qCMvTM/oVLD2Pkm
	12vKisMVdsbloZ7AGTEn170NZxqwGp6yHye6MV/Nz8lSEDUUlEvNtLClBLROLRjkNANdiEIlbbTjR
	haPYP2qg==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqdSY-000000021uL-3JTq
	for kvm-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 20:06:32 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b4761f281a8so3542059a12.0
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756152389; x=1756757189; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=;
        b=pZUkgU0Z4J6UHeKC7cq7umFddQiR3MxaIH97/oSY4xhv6JlV4Ni5RngXmWlUojJ74p
         BQttE0DPkhRe+tqCxboUSZFZbqIuV/YtkkKAhDcuNr4AcMPcPIuD9eE/5MC+WtYRrTjd
         JLrjqL9QzrRvY4ZlDHZoik1Sd6Q9qvZnIC53U7ILuoHLQottgvnKE2C+QraFfBXBNUs4
         KIbn56gDMXfwAlF7fDR0GfP8peddvcmSZx7KkkKPtg9jYw2frwhjJ7XMlDviL3AtJcOH
         6/+Mog8jKqIg1NSxjKn12AAZiQufhiQ6R0i7LN0hPVZTiqSQ3fkWdLSFpIDN0ja8Ii4K
         kzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756152389; x=1756757189;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oyHFbNT6msf6glrd5KFIdZcOF0+oR5scj5fBrCtJpc=;
        b=q+NqbU+HA7Us5aYYOW2lg35BYLCe/EHTsYSs0NFZFhdqwLJ5kMU9F1J1IOrt/cbPty
         ex59a/EetWH9ePglsujmJsyA9/4LBZ8FEYIXYxjIUKy4Xjkq2oIwwyXb6xy3qbgyIG5H
         Aq8Ya1KF+8Ft3P8HNaBC0Mv0KkhVGKwhFlBuHxxplf0ySZvUSx5bPbqNgglqZivXam1Z
         CKtEC6H1PQoEbp9XP+T1khZo7aTRmUXqxrwf5l0tUGIQwcqNq2OrjcBoOqZoqMV3YW6O
         Gg2jG0Y0CgLs9uxZkHhDV2KjIWta9jXFIJuZp/OOA4H/diKTtFRqkn5gSvs+g7jSM/xB
         nJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCVVatnWB8jnD8p23WRui1K4V2+M60fCu1Pyi1u/UduS0PGi1ftR4ZAr2DKdklGI8LvxOHH5DByWtpU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz11y/OT3Cngc3EhHtiJ2a7OpjWNWaeGi4molkCGfVAUB5oFJDX
	8ERujY1U+LTAwTOhFRJ7gdoBGqXZWveBcPjFZ3oyGd3Vp8brHQuc7l8wjTgReRG8Urvaf4eC7kX
	6KkzzJQ==
X-Google-Smtp-Source: AGHT+IHf2Zj5lnIbPMIr1AZKuHUHSE22v55RmD47MKsgM79RfmKmA7vJz/pJwEChfBNBSyo/bobLCf+GttQ=
X-Received: from pjbpq16.prod.google.com ([2002:a17:90b:3d90:b0:325:7fbe:1c64])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a0f:b0:243:78a:8289
 with SMTP id adf61e73a8af0-24340def606mr21242988637.48.1756152389107; Mon, 25
 Aug 2025 13:06:29 -0700 (PDT)
Date: Mon, 25 Aug 2025 13:06:19 -0700
In-Reply-To: <20250825200622.3759571-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250825200622.3759571-3-seanjc@google.com>
Subject: [PATCH 2/5] Drivers: hv: Handle NEED_RESCHED_LAZY before transferring
 to guest
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
X-CRM114-CacheID: sfid-20250825_210630_904558_819B8825 
X-CRM114-Status: GOOD (  12.33  )
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

Check for NEED_RESCHED_LAZY, not just NEED_RESCHED, prior to transferring
control to a guest.  Failure to check for lazy resched can unnecessarily
delay rescheduling until the next tick when using a lazy preemption model.

Fixes: 621191d709b1 ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/hv/mshv_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_common.c b/drivers/hv/mshv_common.c
index 1acc47c4be0d..b953b5e21110 100644
--- a/drivers/hv/mshv_common.c
+++ b/drivers/hv/mshv_common.c
@@ -151,7 +151,7 @@ static int __mshv_do_pre_guest_mode_work(ulong th_flags)
 	if (th_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		return -EINTR;
 
-	if (th_flags & _TIF_NEED_RESCHED)
+	if (th_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY))
 		schedule();
 
 	if (th_flags & _TIF_NOTIFY_RESUME)
@@ -163,7 +163,8 @@ static int __mshv_do_pre_guest_mode_work(ulong th_flags)
 int mshv_do_pre_guest_mode_work(void)
 {
 	const ulong work_flags = _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING |
-				 _TIF_NEED_RESCHED  | _TIF_NOTIFY_RESUME;
+				 _TIF_NEED_RESCHED  | _TIF_NEED_RESCHED_LAZY |
+				 _TIF_NOTIFY_RESUME;
 	ulong th_flags;
 
 	th_flags = read_thread_flags();
-- 
2.51.0.261.g7ce5a0a67e-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
