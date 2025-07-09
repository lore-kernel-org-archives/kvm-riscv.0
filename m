Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58AEC83F17
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 22:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NqXZGxRc4z2UeoipcAK3OvyqNOTlpXsqi8Blk+EWwB4=; b=K8pUv2qva00JpDV6H713Mrhtf2
	KZCjbVydufxcgXW/p0YFUGE2JahM+Pxm0OeM+vjUPNQ2IzTQ65fWa0mRF4RM2PiIVDFL6niawOS/9
	hn938LT2gGHjL/a3DJAdX+oiZ5JoC1Jlc7GGeX+DdZJ7L2cS0m2zb1SyJCekcisR/nTus0HmPTZIA
	pn2EgK7BKOajcLh84zCVCbvBr7Omrt7pQVnfIHk9IaIURZCfZ47lOxuZnGP5A8xQMxXip3PVk/yF2
	M5r5loBirRAZJrUdT55SXILyrTjpcEbHUqEjKhx3JL6d9Iw2n5KUmEC2ee+R9KG2WnuZ77roimMFd
	LTovoOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdjH-0000000AAG1-0cnp;
	Wed, 09 Jul 2025 22:57:31 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZccQ-00000009wcn-3CHw
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 21:46:23 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so356708a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 14:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752097582; x=1752702382; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WaqfKSmh/HmFIuS+sSnBu07GpBGE4YrxsliW83zfkFo=;
        b=RSpwlmaY7mjUuKtC/zVHO/agKLZqFLG5rtt1zcOlYU/np8ldbmCOSFrdNEFlj4f/wr
         byRKuLu19ExDNiy3Sh0p8Fm+A/DWCLjtgI89gRCF/S5vfK/p7J5TMWyejlXUeKrt1H8b
         nv9WAK+v2tFYpA8NjhjvTcmGLCFrTwT3I4PDnLhguXJE9NRlQQ6vY9Z+5x4QJXZwAJCD
         PQGA4EAYxlTLdxgeNlRYm1tEKss1JSbj+mJRFjxaJdosjO8MTPypY45zQX22Ir3dXK75
         QAn2qslevW5ywZkJ/YCpX2T4o0hlY/ehl8ytj46PXxRBNr8IKhcNgVYxxhm0xn5q4KwB
         pB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752097582; x=1752702382;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaqfKSmh/HmFIuS+sSnBu07GpBGE4YrxsliW83zfkFo=;
        b=M9y2TzKkXmYx6E81aRL/CmSxCaTVd+XW434FrHNFcYxHk9YAdaBVzV1VFpfHmrmIXi
         McrLkiHBZNFOYtoBzP95Q0dI/UOz1PGFJo4Ol72NXXTkkPEv5f+glK0pTGLzWTvobpvR
         hTBSdaWOMeDOaILRLWelG5vaUEaG6KzztXinbGpE1/Gz/UmyiSDzU0ibW8FeHmnVEXAa
         5juOI1tex8ZVo4J7JStzLPZr2LmLoycQGe4k9XFwbihuGKbLgBwgSl/N2iVyoaC/yI+9
         DvU8bMwQJZo4MWNGU5cW5wjjVwkA3K7GDS+EXeZaAVNB9mr4PFam8T52e99iVIkbVKIA
         s6wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ5pQdWoFCfWuAGY+Hjs5Bu/DImw8d+Uf/nY12pAUj3tM+PIy2oy6Z04tMlihrVW0UMMpTmQsvqdU=@lists.infradead.org
X-Gm-Message-State: AOJu0YykJP8ycGgg0tI73d1m1J8ZQ7T8VtTsonkcPGqqfUCWyzcZb2wt
	KVt4/U375tzAOIXsTjA3ZvL2L5zmGGlMD/78cpac99xdabRJaCi26yjYooRVp8+P+WIW6I5fHOW
	ftpGO5A==
X-Google-Smtp-Source: AGHT+IGcqFJmd+hfGvHB0iLaIOFTZC36nD5olbTkWzVffAwi5c8bazohN60XOEuv/ND8XITKiAvhLA/8GEg=
X-Received: from pjboh12.prod.google.com ([2002:a17:90b:3a4c:b0:313:230:89ed])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2dcd:b0:311:b0ec:135f
 with SMTP id 98e67ed59e1d1-31c3c2f158emr1976074a91.30.1752097581827; Wed, 09
 Jul 2025 14:46:21 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:46:20 -0700
In-Reply-To: <20250606235619.1841595-4-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com> <20250606235619.1841595-4-vipinsh@google.com>
Message-ID: <aG7jLBAqo1F3SjCl@google.com>
Subject: Re: [PATCH v2 03/15] KVM: selftests: Add timeout option in selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, pbonzini@redhat.com, 
	anup@brainfault.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, maz@kernel.org, oliver.upton@linux.dev, 
	dmatlack@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_144622_802422_1F211B7E 
X-CRM114-Status: GOOD (  14.91  )
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

On Fri, Jun 06, 2025, Vipin Sharma wrote:
> diff --git a/tools/testing/selftests/kvm/runner/command.py b/tools/testing/selftests/kvm/runner/command.py
> index a63ff53a92b3..44c8e0875779 100644
> --- a/tools/testing/selftests/kvm/runner/command.py
> +++ b/tools/testing/selftests/kvm/runner/command.py
> @@ -12,14 +12,16 @@ class Command:
>      Returns the exit code, std output and std error of the command.
>      """
>  
> -    def __init__(self, command):
> +    def __init__(self, command, timeout):
>          self.command = command
> +        self.timeout = timeout
>  
>      def run(self):
>          run_args = {
>              "universal_newlines": True,
>              "shell": True,
>              "capture_output": True,
> +            "timeout": self.timeout,
>          }
> @@ -48,10 +50,13 @@ class Selftest:
>              self.stderr = "File doesn't exists."
>              return
>  
> -        ret, self.stdout, self.stderr = self.command.run()
> -        if ret == 0:
> -            self.status = SelftestStatus.PASSED
> -        elif ret == 4:
> -            self.status = SelftestStatus.SKIPPED
> -        else:
> -            self.status = SelftestStatus.FAILED
> +        try:
> +            ret, self.stdout, self.stderr = self.command.run()

I don't see any value in having both command.py and selftest.py.  TimeoutExpired
*really* should be handled by Command, especially with respect to stdout/stderr
(more on that later), but that complicates converting return codes to SelftestStatus.

And even if we do figure out a clean split, one of Command or Selftest would end
but being little more than a wrapper or trampoline, with more boilerplate code
than novel logic.

I don't anticipate turning this into a general execution framework.  The entire
purpose is to run a selftest, so I think it makes sense to scrap Command and just
have Selftest deal with running the executable.

> +            if ret == 0:
> +                self.status = SelftestStatus.PASSED
> +            elif ret == 4:
> +                self.status = SelftestStatus.SKIPPED
> +            else:
> +                self.status = SelftestStatus.FAILED
> +        except subprocess.TimeoutExpired as e:
> +            self.status = SelftestStatus.TIMED_OUT
> diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
> index 104f0b4c2e4e..1409e1cfe7d5 100644
> --- a/tools/testing/selftests/kvm/runner/test_runner.py
> +++ b/tools/testing/selftests/kvm/runner/test_runner.py
> @@ -15,7 +15,7 @@ class TestRunner:
>          self.tests = []
>  
>          for test_file in test_files:
> -            self.tests.append(Selftest(test_file, args.executable))
> +            self.tests.append(Selftest(test_file, args.executable, args.timeout))
>  
>      def _log_result(self, test_result):
>          logger.log(test_result.status,
> -- 
> 2.50.0.rc0.604.gd4ff7b7c86-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
