Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB9CCD98D2
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lobYY+lU7I2Zg2XJHfpjdawRcgJnRMTnO4Xj8zoNwjw=; b=FAYvnhvhYypmjF
	JUbYb9YLdItcVBNwULk4nf3wUCjMVhvBgSB2MbAe14aNzsSQ4PnNSuOnRD2GEXDxItYJOQ5DlhTVA
	Ss+guahkl++Wm6JvsWGlcBPWpnCr6hbEIdz/gKnKB4EpEucozruJFL31UDKNLWASRduDe+CjbVwsW
	jDMBMP8TdOXLE8pTOcke8QNimpXavbFpVCS/r42vsYjI0w0LTlMnaClArGmgkNBpGO0DdIZawRXl2
	NLjG+el/kVHRoUi2rDspnrn9GRUhZWifitR0lpmD0LBNm5fdwjyCZMAcRUI3GGi83Bkp6WZlOb1kI
	yZyYRYMRlDoCjpqWq7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZbZ0-0000000GM8C-1QYr;
	Tue, 16 Jun 2026 21:43:18 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZbYx-0000000GM7n-3mra
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 21:43:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c69fa0b1f8so22185ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 16 Jun 2026 14:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781646195; x=1782250995; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YMGez037eq5i2gLRSfEcQdwkg5zUJPnIQY7TCbEX9MY=;
        b=HVeXpdy1bIdIT8noIWcK66KErOQr/pK37VEb3EQjI/Yp047E3KKff5gdNdrqr0+ttu
         MA2WUqZfKY8LrvtVuL0WAXfE/ri5qR4bXhTNjEQExQD2YM8/d4T99yL/7a11xxlQy3nA
         DxkDxLty6UJfrNwl2aZdWLOdoH7qV0x6R4oYQZLVZozjlP+vhImNUdagFKFn8UxSbMO4
         qHwSp5PbGJPGOgzLSv0BCOWAILq7CN4Qtykbj94p8wAMTU1b5danR4y0gYKDJ0TQcCIB
         UbuOqJKw5N9WX2OQREPSJMrE0PZzfBc0nOVwI6FF6EkLCWxw7s2CXvXcezfzDR0TruFU
         YJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781646195; x=1782250995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMGez037eq5i2gLRSfEcQdwkg5zUJPnIQY7TCbEX9MY=;
        b=ei6RZul4k7HZJPFljVCVs3Q+Tu5ErQ+a/vt6HOFyGYbgdm7jIlK+gTFX30RYjSULLd
         ORzAeEF5JO/K+Y/ikuUStrJ05Ml5lGy9q5e78ub4vow/zO+DZbkDwiucbqGlLuIueWXB
         TBvCNTQOSqTeZsiRjpomQmBQI4OfqXS5TBdiRfL/O8Ogy6Hm+8SJdd2ygCVPeAo9JTTx
         o1ZRLVFi4vxm4vKeKUXR8fUyShqGwqSucSdqDMIMc0kPn9yLnFJr6euoUR+kSONRyMwa
         BTtKWz/Vpk6ksZvdKNfMVqs8GyKK7TCNl6nigee3mNRXC7Dw6a/mYGpW6sh7QSran+jF
         kaQA==
X-Forwarded-Encrypted: i=1; AFNElJ9CU7Dm4idUZfM5Wy2q54ZcS+cANj8dJj81hInOVBdWfRm0orFqhqYwe7Uc5oeWR9ZzUynEE/r5CvA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMfd9KuVoNkELJpmoO7YhbXVA0630ZA8QGMZ6j7YGLzlFzXIAs
	WAiIvH0TC+KtG3/RXP0WdmEMwqj3aTMTQH73efF5pRqoiK1twDBw/wVFRlJPWnnXzA==
X-Gm-Gg: AfdE7clkkckEhah4mO9JHLDeZm0rffqElWY89mYV3ZtskTdMyHJNUzQY+bQ+nsWO+jM
	ZZN4sgLYpACi11nx5NPxcWnr1dIaJ3pf5ixof6tlMv4bJegZFxFsjibyPh0kgDkIi1EXH8qCHsC
	QZEWz5vFe4uLElVKnThsS/loJvN6OiEgsR+VSK5hF4tU3XOr3i3J87PcoezLaQ+ENaUo4qfxE1O
	ANGiiEcV71FxZFMsCnlBi2c4dc04tKJfgInX+5KRKJxWnwSSQoQkYQGkOHkMoh0Sya621riI9Qe
	td8I3T3y9jvs9d4cAeveEkVcwx3YBS+MFhiT8J4zEOEdeon65wfZbhSH5OfYytu9BwVylOgYoHs
	Ber1xO0gNrHk27pJoVRIwbYhXuV9umZ+oS2+WioATAdErGA/ToU9zR3/trOZWGJWgnM/xaRJtx0
	rly1mZi4tO27EUUD1miggISpTac2lSbn+fo35gvae5GIp5hKoepEmvqce3rA3i/d0xjSTs
X-Received: by 2002:a17:903:1a8f:b0:2c1:4228:3321 with SMTP id d9443c01a7336-2c6bb8b16ddmr657765ad.12.1781646194557;
        Tue, 16 Jun 2026 14:43:14 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c5df3588dsm2346191a91.8.2026.06.16.14.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:43:13 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:43:09 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, seanjc@google.com, pbonzini@redhat.com, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	anup@brainfault.org, atish.patra@linux.dev, zhaotianrui@loongson.cn, 
	maobibo@loongson.cn, chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
Message-ID: <20260616194000.GC1675268.vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com>
 <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_144315_950377_444D572C 
X-CRM114-Status: GOOD (  34.39  )
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

On Wed, Jun 10, 2026 at 06:17:26PM -0700, Ackerley Tng wrote:
> Vipin Sharma <vipinsh@google.com> writes:
> 
> >
> > [...snip...]
> >
> > +def setup_logging():
> > +    class TerminalColorFormatter(logging.Formatter):
> > +        reset = "\033[0m"
> > +        red_bold = "\033[31;1m"
> > +        green = "\033[32m"
> > +        yellow = "\033[33m"
> > +        blue = "\033[34m"
> > +
> > +        COLORS = {
> > +            SelftestStatus.PASSED: green,
> > +            SelftestStatus.NO_RUN: blue,
> > +            SelftestStatus.SKIPPED: yellow,
> > +            SelftestStatus.FAILED: red_bold
> > +        }
> > +
> > +        def __init__(self, fmt=None, datefmt=None):
> > +            super().__init__(fmt, datefmt)
> > +
> > +        def format(self, record):
> > +            return (self.COLORS.get(record.levelno, "") +
> > +                    super().format(record) + self.reset)
> > +
> 
> The commit message above says the printing will be in colors when the
> terminal supports it, but if I'm reading this correctly, the colors will
> always be printed.

I meant if a terminal doesn't have support for printing color output
then it won't be printed in color. Almost all modern terminal supports
these ANSI escape sequence, so it will always be printed. Its kind of
a dumb statement I wrote in the commit log.
> 
> I was expecting something like if the output is piped to some file or
> like "not TTY" then don't print colors.
> 
> Would you consider not printing in color at all? Or adding some kind of
> "turn off all display magic" flag?

Good point about color on/off. I can make following
changes in following priority, starting with the highest:

1. If NO_COLOR enivornment variable is set then don't print color at
   all.
2. If FORCE_COLOR environment variable is set then print color
   (default).
3. If output is not TTY then don't print color.
4. Print color.

> 
> I also saw code for a sticky footer in another patch in this series,
> that's probably not nice for other stuff wrapping this runner.
> 
For sticky update, I can hide it if there is no TTY.

> > +if __name__ == "__main__":
> > +    PYTHON_VERSION = (3, 6)
> > +    if sys.version_info < PYTHON_VERSION:
> > +        print(f"Minimum required python version {PYTHON_VERSION}, found {sys.version}")
> > +        sys.exit(1)
> > +
> > +    sys.exit(main())
> 
> This shouldn't block merge: why not align with the kernel's official
> required python version?
> 

When I first proposed official version was 3.5, it got upgraded to 3.9
in commit 5e25b972a22b ("docs: changes: update Python minimal version")

I was using some APIs which were not present in 3.5 and 3.6 was the
minimum version I was able to run all the features I needed.

It just stayed that version and I never checked to keep it in sync with
the latest python version.

> > +
> > +        run_args = {
> > +            "universal_newlines": True,
> > +            "shell": True,
> > +            "stdout": subprocess.PIPE,
> > +            "stderr": subprocess.PIPE
> > +        }
> > +        proc = subprocess.run(self.command, **run_args)
> > +
> > +        out, err = proc.stdout, proc.stderr
> > +        self.stdout = out.decode("utf-8", "replace") if isinstance(out, bytes) else (out or "")
> > +        self.stderr = err.decode("utf-8", "replace") if isinstance(err, bytes) else (err or "")
> 
> I think it would be useful to capture stdout and stderr in order that it
> was output, so that the output being saved shows everything
> interleaved. I think the order could be useful in debugging.
> 
> I can see benefits in knowing which was on stdout and which was on
> stderr too, so is there some way of having both?
> 

Both approaches are useful, I am not sure how to achieve what you are
asking reliably.

However, I think separate stdout and stderr is more useful in automation/CI
tools. Considering, runner is for the human use I am more inclined on
having combined output of stdout and stderr as you are suggsting.

I will change it to combined output in next version, new filename will
be "out" consisting of both stdout and stderr. If there is ever
need for separate dumps we can revisit it.

One thing we will lose is in current approach, non-zero stderr is signal
of finding errored out runs. Not a big loss as same information can be
grepped using master log file.


> > +
> > +        if proc.returncode == 0:
> > +            self.status = SelftestStatus.PASSED
> > +        elif proc.returncode == 4:
> > +            self.status = SelftestStatus.SKIPPED
> > +        else:
> > +            self.status = SelftestStatus.FAILED
> 
> Using this class-based pattern requires us to do
> Selftest(test_path).run(). Would you consider using a function-based
> pattern, like run_selftest(test_path) instead?
> 

I find current class model provides an easy way to group data in
hierarchy. For example, test_runner has list of selftests which it needs to
execute. Selftests have their own test command, output data, result
status, etc.

Both are suitable to implement runner. But I am little hesitant to
change it now considering it is already written. If you can provide
benefits of using functions approach here then I am open to
rewrite.

> >
> > [...snip...]
> >

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
