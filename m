Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A441C531F9
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EM35YfDKu6921DAQG8fPydWhYlGCzzEjhpbvpgwVJo4=; b=v14eJk1z8pEGgh
	OpZvAkWVV4patv2q2SAvJqz0FrL1EgEKL6AjpqF9YSFRRRUSRPkxE/Ex9DQ8dkDfBOx+/mkdI/I1j
	0GKFzOO4GL8n68chtYRbHLVoWBXuIz41rT8pjEzR7Sok7vpzruWut4snvO9Gr5FOQOfllBfbl5Piy
	HtbJLneW769tKN+zBcKK05iiC9WkpZpfeh4SpkV30U1t9BYgl6Wsf5vTiyXNCG695nsaSbpPj2h0W
	FHEMp3BNWgJbkTkJvxppP1W5VbL2fViCjqr0vR6aKDIBcPB7J4esZwNZrZP1JMTv2E12wBQQ+mfRa
	saVa4o7kxI6LiG+iA4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokt8-00000005r6V-2rGp;
	Tue, 28 Jul 2026 16:42:42 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokt5-00000005r5B-1mQm
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 16:42:41 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c15f020a223so6895366b.1
        for <kvm-riscv@lists.infradead.org>; Tue, 28 Jul 2026 09:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785256956; cv=none;
        d=google.com; s=arc-20260327;
        b=YKN65HXB8wLowVPRimHuYKBYm/5uxG8o8l5k1KQF9Y6Qedx9Kdl3bR6YaHb+giTqFR
         qnlZqzNyMCOu8pXJroNXOudYIPACKBN5tIAu8SwMzEOinP/0EmO9HWocoQNLNwCRGsFo
         v8WQgOgY2drrqQ2jNcXpd6x2/xBbNzY5l6HsFNOb5RzwPnmUBORxsS6gXnI0WTtHPayH
         ltCYpKdOCXpoeV37s32vJWB3TXfQuvo4U0AuqYFnYckUeILtuohhq9RlDaeXAcHROT2+
         i/15RzqP/fP10RJ5R7y/nY5VEHHlfgJV7k4lOl6S+WaezJK5CB72O9iOrCelVQLe1Dbe
         a0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eRawWXBOm1UVfqgMPk0g+KIpk+hFbB2MCDRZOUgVRNU=;
        fh=vqRYnprkNkguFuPorU+71fjYcU3kUDSqyolW9zgOISY=;
        b=GaB473DC34fSmhbHD3kaHQtX1RSu7humrUy5NyYwqcHdYtliAMhKICYOC6Pte5zLls
         GN7HePodPOx81sE/jlD/bdeTUGx/Sl41kodOr2u1vvDfcK28dFMazvFloLs6TXojDpuL
         gvwaDY9uTS+GqB1Ph+bH3t1px6CHnHzNi3ZNDyMBkZX4hPIv1Ofgn59A3HlII2rvEQhU
         4F49iQBaaXHSHYmh1yj7ukfRB51FAWAyjNEZy7I8SRCiiZ59Ecgw2/R56mGXr5PTsk3H
         Y3lF2AqJG35Or3Fh+1oQhVXBSA3K8s/ftPSjou7//JDk36G38m2+XRbk+aAW2nTa+Waf
         SDZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785256956; x=1785861756; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRawWXBOm1UVfqgMPk0g+KIpk+hFbB2MCDRZOUgVRNU=;
        b=qHASxXhKkKAbhxngeYDQ0AeCQBd3qEmQUSQDQ4SAQfFG0yNaS/6pQ3hARYCcYPHm4E
         9WJDi4Um7wcdgnvPb6v8LQmlBmd6A22Xv9eg5T0xq+8Z2Dp1K7RR6kMzHMQ1CvC90L+2
         uz7uAl0kuHV0YKCWd6zS7tQFt0T8D5E7m3nYbKhUwTLs4x3AEDD/wgMilvPuXwk2Oidz
         BE+6PVb9PZqRZ+3iYzt6wAQbqzr801BNIaKl+9yuVenv07EOmPE5AU5nG5awE2mvYiZT
         qy3Z6TUIg3YBZPCKXU5Nhq6bd+e9vvZco5Mx9oFlTaNFzWrilGBv6cjAT9+eScCpLS5S
         ch2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785256956; x=1785861756;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eRawWXBOm1UVfqgMPk0g+KIpk+hFbB2MCDRZOUgVRNU=;
        b=H0U+Erz7G1oraIysiUjdQfxezrKQeq2xEnLZxTZbZyOTIy+sDelyTzcEpd7tgOegTj
         PiU0cQ9EJg+i9Rs28dFuo73mdFl4ovd8idSE4lzOj9KC1xUqBjUbuzLnbH+7bCf52Y+E
         +RQzKXy8d6bBpo0xWuoDsjZEf0eIaHm8ahWbx9ND/GguvWdhG5HqZUd2jPN5+Ugm4zqX
         RPXMxJvDP1wOmRV0CKb6VYkgQEp/ZHXX1HZw2OsKlv0MhxIZVjvKficVbi9sRCE5KCg0
         uhkhJo0N19DioXANz6V0rTa7b6UGcz+CMYvxMvZVI4IJkF6vDcoi9C6JwMR1aOYNkGL6
         5BNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmHOLW3LoR/NcfeVGJlxTCbnYTzvbQ4GwD44gErIUiKBVNT5MHv1Tx90SNL36fHVWxEyQkBxihGKA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqlLJYZDxw13F8MMLDqUdb2KH0JQDXzlEqRdQusmY9oQBXBT7T
	olq6QUUlh0tojh0WsYMYTXAswhJ9EjqEG0sAFRw+FFT9H6AQwJETWhE7ysKx7hu3ed/feP+Ypyp
	oZZ2oDF+UTojVwrmQpSEmGq+uTJ14qg==
X-Gm-Gg: AR+sD13k8wRSZK62LPjybWMQs+IWFiR5RZFIOVQbkf7aXfRfMGp8CynVSFyXyjlpTQD
	v4UgcTakkZkALQxwfjKYN7n8J0FjmlqGdfnDihxbBhSYZ5KeqS/iGvNDw65xUyNR2UXNOd5vY7p
	0cIZixKJ8dXrkhkkNT/aVKkOHy3FmhZ0qxVrnk1/y9jQv6WtJo/06u7z5TpbHLRxj/Yd4Fyd0Kz
	ycuHf7w83zlxiA9Zu7X0LDV9bYYviOH1D1Z1YFAYjtJx5MljRTMVR5UH3sHk9xFcQL75EcxVvDB
	UNDo72Sw35qmIg7DV3HRPEQqg2S8J1BN3KBuzFARX5vt1Y6zrfdlhDTzkfUk6yrsS5Q9gQWzCBP
	9aJywwMo=
X-Received: by 2002:a17:907:a04:b0:c16:2d90:68a7 with SMTP id
 a640c23a62f3a-c1f71e568ffmr173688366b.26.1785256956205; Tue, 28 Jul 2026
 09:42:36 -0700 (PDT)
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 29 Jul 2026 01:42:24 +0900
X-Gm-Features: AUfX_mzY5IhTWpi5crtF8mrU7J89TXc4_WGd_VuJLT6iuHP5tbvLAPaufRqw2FM
Message-ID: <CAGEsz8GNHFCOZ=-_y56rK1aX+Ze7w8qVqZSQ-OuGo_dPC4bXCw@mail.gmail.com>
Subject: [PATCH] RISC-V: KVM: Synchronize hrtimer callback during teardown
To: anup@brainfault.org
Cc: atish.patra@linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, security@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_094239_685074_ED9C1202 
X-CRM114-Status: GOOD (  12.16  )
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
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
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
@@ -61,10 +61,13 @@ static enum hrtimer_restart
kvm_riscv_vcpu_hrtimer_expired(struct hrtimer *h)

 static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 {
-       if (!t->init_done || !t->next_set)
+       if (!t->init_done)
                return -EINVAL;

        hrtimer_cancel(&t->hrt);
+
+       if (!t->next_set)
+               return -EINVAL;
        t->next_set = false;

        return 0;
--
2.47.2

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
