Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD5AC54F54
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZUBvvhTEPRBp2oKMR+DpD1n84s829Nnr7AHZvdWscs=; b=JHSFsyUvH+WLts
	vBvzV8mSUEOpugs8Y/WjwfeoXfWNMjF8JKJFzVJISgB2+7FaIeRZ8La49wg3ssDD0NIORGwUwioQp
	bQgNUDPZVPDO6Oyv35/I5Zb7gmQ6srywx9lRzCASFH+P+nxQG2mM6JiJ5mgb2nYnKjMA++VtJvE3U
	3LC1kDvcbBDqW40y2lHFjUxIXxgH0jpC8Sj7g2h3IvnGDj1mDdQGouxuQUGstIP8RgX+775pr9x4t
	3ypNj1DkeLhQBfvSgY2kc7DVheta0fXUf56OrUwXP0sxY/3Gi47COG4pW7yK7qX9v+Wk8hRMoF7K7
	9ZRv5OPpJtywCUGmh1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqDF-0000000D9YI-40gC;
	Fri, 31 Jul 2026 16:35:57 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpqDD-0000000D9X0-3orY
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jul 2026 16:35:57 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2323785b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 31 Jul 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785515755; x=1786120555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU2QgWWmiwDOTc97tpYJfn2gTZC2cyR2MioCmCqpMNY=;
        b=N93DYTU93s3rTeg3xaiUsCN3SZn4TR8grNCzgM+kd8knnuZ4c+MUlntHgkGLB814Z7
         9lzbA+LSF2xmMTn9ZkJxlB7ywnGvlYBIVbYogYkroza2Y3qhgPfk4dSVLzXIs4TPwd3I
         zU1olDgZ/WGshQvUT8nAnYLXBvFWaFe7Tb/SiCIYHStJZGXmKZfU4BDaBZ5gKI6LsZmH
         TziSA6W8SbxAHIZ4PuqzbCxP2TXX76Ua8vzRMYAOg+f0OAYXlz0Pk3nxa8ZKMuNmLRvG
         556QGYR0uYmEX7QUBfnJXFiT7s7y3RkoCvXgQXy9I0fkKRhzT2f8Xw7KT0tHBfiKPhny
         RRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785515755; x=1786120555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rU2QgWWmiwDOTc97tpYJfn2gTZC2cyR2MioCmCqpMNY=;
        b=oxxyUDviPoE8qAabpackougdQCiwYr6mxubE5lFvbSXmtafWXlsthBlfEDVlJYFTeE
         3+5EBuQTdjGXdGHdBz3OVk4aBKJQzlZ5ffpycKQTieS7sEX+yIBF2vIwKb6F8Y/KAmEM
         u43hjD88rUVD6mBInxJ0pb5b0EMajSc+fZSpynGEHc8P2ZoQS+f4+s6cYxEfpgygD9XK
         qZhpxXk1+LxX6QbrW8F8q3y5uJyWCjiJ3q/DymwKE2vTAKH2cROLT8k34zlAEBiGQNZl
         59MZfC9CgziJex/GLqaDyEImEkN+e5zEEfkgQ0vLSVFnOj/nHqWQiNRGcNngCNydU/CW
         /WqQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjTvfZtmhR2ypAA6A8r+p7LnjhDdnEjDt31x6cryblxjIz1Qo8VIKQ0zzxCe8cl/iPm1tjep/7Jic=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrbCNcm9sMzW+JpgR6BuNhkQJ+W9AitpjPeosAK2IhuSRz56kk
	0TrzI/4WjxO3mLCbejtib8ugEKQ8h2kP7j9YcT0lrknKHjGaO0WlZ4k=
X-Gm-Gg: AR+sD11x8jYz+YgbAZ2FOgtr9nXAlKf7pgOQEP47xtNlA2KK2yvZ9XMsLB3ewQiS8A3
	bPVefQaS2emukrX6REMyuAY5AugbDCCKPw8b0I+VCFWAmYWHVVhOaeKfn0fbslVf54MO9uvUlej
	7uPybrYAhfP6keAXAbiylM8/Bs0OIAhjlSmF4bresWR9sfVnNgqQRI5b6Jn/XfWj7SYBb0iWAue
	F/SOTFCM5c+/NDHGRy/FdrwE4PziB/STxTvibg3ALCTqz0zsFuzhpcutKwCbU34LnHTgqYRUPeG
	0mwxUDXRYX11g52T83SikXVKkXtE0zdYO6hTNth83jcJFM9wTnFnpL+95aHAsHZWz6N4F8Ywfde
	IDttJTAAaL5R5NhbGe65Pu0VN6PsMAd5XK+9RnOumoq1EfeMbvIQiJH8Rc+ZWCy+kmyncZk+AWH
	Cw0le0pU+B62jU0QVny6Rht38pP9ywhKweNWiu9yvUoHLjF0bNlpYumPTR77LClSBHHscE1fDXA
	eCAvjSQQXSfKO5VeDCYhYtJqBmAH/umQur+mJssJp6l8+LROGA8CsNLIkzC0sATYa5JfJVSGAv9
	Z8GsSdGwzBsdxx+Sm9JwQuw=
X-Received: by 2002:a05:6a00:14cd:b0:848:40f5:ff5e with SMTP id d2e1a72fcca58-84ed7517231mr2195457b3a.37.1785515754707;
        Fri, 31 Jul 2026 09:35:54 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc422ff9sm674942b3a.54.2026.07.31.09.35.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 09:35:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v2] RISC-V: KVM: Synchronize hrtimer callback during teardown
Date: Sat,  1 Aug 2026 01:35:50 +0900
Message-ID: <20260731163550.46991-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
References: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_093555_949191_D4DBFDE0 
X-CRM114-Status: GOOD (  13.85  )
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

The non-Sstc hrtimer callback clears next_set before its final uses of
the enclosing vCPU.  If teardown observes next_set as false while the
callback is still running, kvm_riscv_vcpu_timer_cancel() skips
hrtimer_cancel() and kvm_destroy_vcpus() can free the vCPU before the
callback enters kvm_riscv_vcpu_set_interrupt().

A guest can arm the timer with SBI TIME and request shutdown with SBI
legacy shutdown or SRST.  A VMM that honors KVM_EXIT_SYSTEM_EVENT and
destroys the VM supplies the teardown side of the race; no post-launch
host ioctl is needed to arm or request teardown.

On upstream master 62cc90241548, generic KASAN reported:

  BUG: KASAN: slab-use-after-free in do_raw_spin_lock
  Write of size 4 at addr ff60000005e58898

  kvm_riscv_vcpu_set_interrupt
  kvm_riscv_vcpu_hrtimer_expired
  __hrtimer_run_queues
  hrtimer_interrupt

The object was allocated by KVM_CREATE_VCPU and freed concurrently by:

  kvm_destroy_vcpus
  kvm_arch_destroy_vm
  kvm_destroy_vm
  __fput

For deterministic validation, I added mdelay(1000) immediately after
the existing next_set = false assignment.  This only widens the
existing post-clear callback window.  A no-delay trace build naturally
reached the callback-after-teardown-start/before-deinit ordering in 12
of 200 runs, but 1,500 stock-kernel stress iterations did not produce a
KASAN report, so natural reproduction is timing-sensitive.

Always invoke hrtimer_cancel() for an initialized timer.  Preserve the
existing -EINVAL result when the timer is no longer set, but only after
synchronizing with a running callback.

With this patch, hrtimer_cancel() blocked for the full widened callback
window before vCPU destruction.  KASAN reported no error in 100
fixed-and-widened runs or 200 fix-only timing-sweep runs.

Fixes: 3a9f66cb25e1 ("RISC-V: KVM: Add timer functionality")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Add the required Assisted-by trailer.
- Drop security@kernel.org from the recipients.

 arch/riscv/kvm/vcpu_timer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

AI disclosure: I used AI assistance during the audit and am treating the
issue as public as required by Documentation/process/security-bugs.rst.
The reproducer and full KASAN trace have not been posted publicly and
are available on request.

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index ae53133c7ab0..a2cd277a4059 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -61,10 +61,13 @@ kvm_riscv_vcpu_hrtimer_expired(struct hrtimer *h)
 
 static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 {
-	if (!t->init_done || !t->next_set)
+	if (!t->init_done)
 		return -EINVAL;
 
 	hrtimer_cancel(&t->hrt);
+
+	if (!t->next_set)
+		return -EINVAL;
 	t->next_set = false;
 
 	return 0;
--
2.47.2

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
