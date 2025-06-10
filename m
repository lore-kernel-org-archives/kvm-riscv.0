Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6114C61DB2
	for <kvm-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5g9U+9vDx4uc7sgFncFf6EmMRl8sQRBzyplysAVfdqI=; b=b0OvGqWBbhLqRrAIdsWj67p2qP
	nsNyeFiPvJuSw7G0YAUniLs4ryEXYK4WK3vWg692Ha3mFkYChm5drg9BsAN2dRXI05oMFlyB0Lvnd
	hXg2hqyExXC/ZCUqCRcglL4njQ0fBgAn5ke04YF7WDbiU+B/aByscb4aButGfk1mF137lKbWjEt0I
	t1Pbk8boAkAy9z1HXeRHT4+z6KkxkgS7j2RrhkfI/Bf+rkRh4ASDygro21EkTAUkJuVXmmSckvPJg
	QpYDJWqzLz08VLTr3nXhP6nOXZB/nyA/fcfLYid87kJ4JWO9T5dgrKNSQhYyuw+zuEfQRc0N5geSm
	V8uw/s0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7mZ-00000008H6P-0kcP;
	Tue, 10 Jun 2025 22:49:27 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4s6-00000007wWE-2aAI
	for kvm-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 19:42:59 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-74868e73f4fso446280b3a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 10 Jun 2025 12:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749584577; x=1750189377; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oDALznD/3c9MVqTY3u+MwmZHInHphiU0CPL0RvaHEeA=;
        b=Xx9uorjyRqI6PSxP2IGy0Xiy3vcNaO+gy4a8v53w7ACydR8PTwztxRpCECf/pwfdGj
         4WLe9KWQ+2F+xfQnCxlpbwtM0ogXHCDb0amhJlbMlIyKAhCrwwdlex4gOxxBH72gko7O
         ktdBhqwBdrGP/xGFjfkuDJIRG1JjPulhY5rwXroBT94E2RMv4Sm4fXE86qa4rqN3hDtH
         9cfSsGtcQdhjE+h+W6ZolEfjmh8luh104G9Yk3xG6Nehok5Y8w8G6NB1mZxV1yruqAo3
         shZgE8IgQ+7Ye9tlSAsyKGdHbSXf/XPFAKDWtBs/J17n+2oGAPyKhmMOtUkzbXfQXaJ/
         fEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584577; x=1750189377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oDALznD/3c9MVqTY3u+MwmZHInHphiU0CPL0RvaHEeA=;
        b=ipH9e8iz7uPELcZUbL2RYiWXpNlPvP9JX2nijnBIQAZ8qI7e2VYNWCFg3II69VW5r6
         QPaR/dFcu2HaU+NirHj+8DPWbPdp+BY0A04x7gwllFppN8IL6oHHomcm3JYf+bexDqpV
         y9XOtGaMsG+KXnoPh9sLVgweADlKTnF+Y67MJGwBxozETPwJNiLXyHTgKLHq5m999Q38
         Ehgvti7yeYwDMaKGiGe6me2d5owItuuuUNBNDRPjzfVJfbmr2FCK6G54uVoGYx32sK1v
         gvZ/9B1wP+lgbdN3+ITx1d+nW8hBB527xUmUE2fllI5mlQmTJLAhx7h3UW9wHzqUUWWn
         zjyQ==
X-Gm-Message-State: AOJu0Yz0sml77TIEXTgS5RbcgRHpaoEzGI4jrhgw4+2b1pW7r/+g4jKk
	r2piW+dVGZCQXRRBn9bWHvoBLuDOvE6Yoy7bV+uVlLX3Zz/ZEAa9Z045KgKIH0F9/GeccWzLeUX
	SHo95LQ==
X-Google-Smtp-Source: AGHT+IFcAOO3RSRtE5/jK1DkybZihifw/RBRr2CZFZLIL3K3lAfdD4oPG0LZgY/dzFkx0SmxXZyKAYsG10A=
X-Received: from pfbhe19.prod.google.com ([2002:a05:6a00:6613:b0:746:19fc:f077])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1703:b0:736:6ecd:8e32
 with SMTP id d2e1a72fcca58-7486cdfcc3amr980353b3a.21.1749584576971; Tue, 10
 Jun 2025 12:42:56 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:42:18 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <174958127087.101429.2266783610076724411.b4-ty@google.com>
Subject: Re: [kvm-unit-tests PATCH 00/16] x86: Add CPUID properties, clean up
 related code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	"=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_124258_649590_3CBDC7BA 
X-CRM114-Status: UNSURE (   7.60  )
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

On Thu, 29 May 2025 15:19:13 -0700, Sean Christopherson wrote:
> Copy KVM selftests' X86_PROPERTY_* infrastructure (multi-bit CPUID
> fields), and use the properties to clean up various warts.  The SEV code
> is particular makes things much harder than they need to be (I went down
> this rabbit hole purely because the stupid MSR_SEV_STATUS definition was
> buried behind CONFIG_EFI=y, *sigh*).
> 
> The first patch is a common change to add static_assert() as a wrapper
> to _Static_assert().  Forcing code to provide an error message just leads
> to useless error messages.
> 
> [...]

To avoid spamming non-x86 folks with noise, applied patch 1 to kvm-x86 next.
I'll send a v2 for the rest.

[01/16] lib: Add and use static_assert() convenience wrappers
        https://github.com/kvm-x86/kvm-unit-tests/commit/863e0b90fb88

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
