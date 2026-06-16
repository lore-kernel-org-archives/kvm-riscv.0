Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B636ECD98D2
	for <kvm-riscv@archiver.kernel.org>; Tue, 16 Jun 2026 23:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4HrQ6voJmhho+pEmyPlythxLXp+mR13wkogN83rPBUA=; b=vsRH1lDKYoJxjQUYG6H89FXCLT
	fMK6/lPzFl3d+5NyLMmVwULLZAtMo+oE760SPgYYCaDIvlgZEkLOiAC9QQT2w0ssV1fzREpJtgIdp
	x9uTI/H/Ne+lSQIO1Kzzfva62+5aNCqhVOnmNwuS4SjKYyOL+UzgrGgg9tXSLV2cVUG+g7hXVyA7C
	IBqP0rqFqNzaSPQqYWj7nrjOZCYk+awc1qQd0HxgK9oQNDHHoClFsJwuF0c2VCG6tJ7AnZuCrvZMW
	SR44E7eHmxPZYco127h0Et4BMgGMLcjIWysahW8JcXzkgmV8JKiqaPwRbxJ0tIH9dnMoiVzIv2bMu
	erUye8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZcph-0000000GOeg-2pGy;
	Tue, 16 Jun 2026 23:04:37 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZcpe-0000000GOeG-3BXV
	for kvm-riscv@lists.infradead.org;
	Tue, 16 Jun 2026 23:04:36 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-13807d2f898so5563836c88.0
        for <kvm-riscv@lists.infradead.org>; Tue, 16 Jun 2026 16:04:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781651074; cv=none;
        d=google.com; s=arc-20240605;
        b=fR+9qHJjhY4rIXoxewh8Rd3xiw3+wz2XluAQGf0fbfn5IQ8Y7vruWG4CWpWD7Z5fal
         3Q4KvbstO1zLnOIWLgkh+udVom1ldVCTkppKDfQHeZTWX/c1yBQqUoDSikh6tJJjABsv
         QJ+R2NX7STCqW2qw/AvpuD0xKOVNj+4KS2dIL0401ZCrkKtHLt/gltVzQRsBpRDH43m1
         sZKZJHcoc79cu0HiGidYqz+LAWH3umf3mWJwHvBPJ86OsBaEqTeNUM+88FDFlxlCH8XP
         YpaRjTGOL5yfdjJp8A8bqSm4OKDwdCmlyYI+aZGRSVMpJokDwWcRa8olz0AmdvI3Bjin
         kkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=IDtlYzSJ10HUdDDSmXfhgs31EXUJLXgmuoKNNIFB6PM=;
        fh=Oa6LmFXV32lUp8DZsD9+JCn81HX7NLfKWFiGN9y+bmc=;
        b=lteLh0gSr+IzS/JVdMsRy8RfH0qkCofIbk8IPWEqE+plvOhqy6cfPRob88El0lFGtx
         uoQKj8jJAKlXC0L4J/nDde4WXieBgkuN/cDvSuTJZF8kqBl8qkeBxisU6O+S4wgdo0Oc
         HxQUQkNz2EzpGyMnvJ1k4IKIc10J8T7dxbrgTb3VpKGLeDob440+tm7tqrHcEaAPM7Qp
         cpI0ytP2WOprBzkaTEZgONSwdz+jBSynzwXbSkbiZbuaEawQBoXP7uWFU5H03BN4pE64
         /e5r9AsjeLw9GWN3YSkymDTp0WEUXBM50QV1Vm8kVJvKvEgTQzRXvgaly9x0LD++b9vt
         64MQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781651074; x=1782255874; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=IDtlYzSJ10HUdDDSmXfhgs31EXUJLXgmuoKNNIFB6PM=;
        b=QM6tLNiyVmc6pFzNchDwkrhOGNmxjWRo9Artp3UHtNvKbV2EHi80OvATSdUiT1+tdB
         r7VIjL7S61kR1ikYNYD3OwJ+vE4eenaJnMDhN3jYGYVEkDkcbB5gkFjS6wSg9LcxL9NJ
         vNthMC+y8tYD+wOqEphT3OtkzRg7cmjnvZXR4Ovz6X2ZSXWIdZVMZpfyJyHc/g0fUPRs
         Xfus3eDhpIwCUnhKbr+oMYSiD+j0hTcAs0NcI9LGMXDkIWzWzvU21Wg1UMwNZlfy3uGC
         saKUSoB8MjQKR5uh6Bue3xxihWt/gdGNXIbM6Onm+pwyuRCupMn9GZ8ENa+XEa3YO1mE
         cI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651074; x=1782255874;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IDtlYzSJ10HUdDDSmXfhgs31EXUJLXgmuoKNNIFB6PM=;
        b=LXIj0lV+Fh1Hok0KEoniofIJtnknJrCuxb0chrTcSchz0Vfxg9i1OIZx99rI1OVTSW
         Bkk9A30InlPW3N5ZI4BxLv9WeV5rndBq1hZc11yZK9VH4fKYSSIxystVsEMH5ubOtWLg
         Ty0UsD5CkjdZFDUcgICnplAFTvPD71RuuGFsZmx4PzkK711VuhZLpCH+x7r+dR2mgxNJ
         QubmxhRo85SkcM++Zu/PwjOSaebaI1IQtnzbOY13yg+Xm1lRMHrClXQjwmN8pZRhEbE+
         +Ofri8sOe50NYJ1IVqV537ryGwvZEEqmOLe/3SNQbowXzVU225DVLooT3XXDdqZUIJ/q
         ONAQ==
X-Forwarded-Encrypted: i=1; AFNElJ836BzVylo1scfOOFFyTQUnyhK2Cy4l041Ma0+rq7IKSXUb9r08d0rMG4ogQmli8N2tVCr9v3SFj84=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmqDbeE5oxHGnl0olsmgNUlN5Qh3R4SfQiLRY1NDY1AVIYSWOa
	2jzK7vkDQN/M4Sajo6AFcCG2Fw4lb2mMqIC1hbws9CRbB9fe5D2u1YOOx6EkYzZ8DC38fWHYFqm
	C3XaatFnDWlYW94EUA2huPGKEIBDVW3225+oXuYEh
X-Gm-Gg: Acq92OGBTpHPgBF97Jw3sTrYae9+OPhMTW6k3hlrDqfX/SzQ2y14yWG+s8MYP1ZSz7C
	gfOBGYjdyyinsTjLwtA1NzWDPmyp5+IQJfy8bBxCC0WWGLppxXGb83Sivn8FCfJuXNsHjlrhGqV
	+TcVx+awieYT9M/wiM0pkYZ+bSAAQrUgCgQPIBR1mx/2B6U50te3b/ti+U+Zrwt0r8c3PVh6ANj
	VvbDLCsKJp+brCKbhS3cogDWmDS7GEU0OegG6XRPU8vGE4DZEKTDY+uQAvBRFzWrTtAowiq8jZj
	tdNiKHMz0iVKog5ly2gAVeMTlq78ZWGJJqmRYtfJgwB//u/EpdR2BEnQ24Jqv7xgaskZTQ==
X-Received: by 2002:a05:7022:fd08:b0:137:1ae1:bc2f with SMTP id
 a92af1059eb24-1398f6547damr476392c88.13.1781651072971; Tue, 16 Jun 2026
 16:04:32 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 16:04:32 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Jun 2026 16:04:32 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260616194000.GC1675268.vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
 <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com> <20260616194000.GC1675268.vipinsh@google.com>
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 16:04:32 -0700
X-Gm-Features: AVVi8CcXGzWmHVP01yNQ9cwcnpEans6MeetfVkGQMij7VBGAo0JuOj3VXMX_DH4
Message-ID: <CAEvNRgF3a7BPBzqDOc0pXe4V1qxXfSHx49VyBHVRzJa0Mch+Bg@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_160434_864455_E40F4762 
X-CRM114-Status: GOOD (  38.55  )
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

Vipin Sharma <vipinsh@google.com> writes:

>
> [...snip...]
>
>>
>> I was expecting something like if the output is piped to some file or
>> like "not TTY" then don't print colors.
>>
>> Would you consider not printing in color at all? Or adding some kind of
>> "turn off all display magic" flag?
>
> Good point about color on/off. I can make following
> changes in following priority, starting with the highest:
>
> 1. If NO_COLOR enivornment variable is set then don't print color at
>    all.
> 2. If FORCE_COLOR environment variable is set then print color
>    (default).
> 3. If output is not TTY then don't print color.
> 4. Print color.
>

I think we can take reference from what grep does.

+ --color=auto (default), if output is piped or redirected, no color.
+ --color=always
+ --color=never

>>
>> I also saw code for a sticky footer in another patch in this series,
>> that's probably not nice for other stuff wrapping this runner.
>>
> For sticky update, I can hide it if there is no TTY.
>
>> > +if __name__ == "__main__":
>> > +    PYTHON_VERSION = (3, 6)
>> > +    if sys.version_info < PYTHON_VERSION:
>> > +        print(f"Minimum required python version {PYTHON_VERSION}, found {sys.version}")
>> > +        sys.exit(1)
>> > +
>> > +    sys.exit(main())
>>
>> This shouldn't block merge: why not align with the kernel's official
>> required python version?
>>
>
> When I first proposed official version was 3.5, it got upgraded to 3.9
> in commit 5e25b972a22b ("docs: changes: update Python minimal version")
>
> I was using some APIs which were not present in 3.5 and 3.6 was the
> minimum version I was able to run all the features I needed.
>
> It just stayed that version and I never checked to keep it in sync with
> the latest python version.
>

I see, no worries, not a huge issue.

>> > +
>> > +        run_args = {
>> > +            "universal_newlines": True,
>> > +            "shell": True,
>> > +            "stdout": subprocess.PIPE,
>> > +            "stderr": subprocess.PIPE
>> > +        }
>> > +        proc = subprocess.run(self.command, **run_args)
>> > +
>> > +        out, err = proc.stdout, proc.stderr
>> > +        self.stdout = out.decode("utf-8", "replace") if isinstance(out, bytes) else (out or "")
>> > +        self.stderr = err.decode("utf-8", "replace") if isinstance(err, bytes) else (err or "")
>>
>> I think it would be useful to capture stdout and stderr in order that it
>> was output, so that the output being saved shows everything
>> interleaved. I think the order could be useful in debugging.
>>
>> I can see benefits in knowing which was on stdout and which was on
>> stderr too, so is there some way of having both?
>>
>
> Both approaches are useful, I am not sure how to achieve what you are
> asking reliably.
>
> However, I think separate stdout and stderr is more useful in automation/CI
> tools. Considering, runner is for the human use I am more inclined on
> having combined output of stdout and stderr as you are suggsting.
>
> I will change it to combined output in next version, new filename will
> be "out" consisting of both stdout and stderr. If there is ever
> need for separate dumps we can revisit it.
>
> One thing we will lose is in current approach, non-zero stderr is signal
> of finding errored out runs. Not a big loss as same information can be
> grepped using master log file.
>

Here's an idea to have both:

        import selectors

        process = subprocess.Popen(
            command,
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            bufsize=1,
        )

        sel = selectors.DefaultSelector()
        sel.register(process.stdout, selectors.EVENT_READ)
        sel.register(process.stderr, selectors.EVENT_READ)

        output_lines = []
        stdout_lines = []
        stderr_lines = []

        while True:
            events = sel.select()
            for key, mask in events:
                line = key.fileobj.readline()
                if not line:
                    sel.unregister(key.fileobj)
                    continue

                if key.fileobj is process.stdout:
                    # append to stdout_lines... Might need to deal
with newlines?
                    # perhaps even print it from the runner's stdout, so
                    #   the runner gives faster feedback for a human
                elif key.fileobj is process.stderr:
                    # do something equivalent for stderr_lines

                output_lines.append(line)

            if not sel.get_map():
                break

        process.wait()

I'm also okay if it's first combined, and this can be an extension if
it's really needed.

>> > +
>> > +        if proc.returncode == 0:
>> > +            self.status = SelftestStatus.PASSED
>> > +        elif proc.returncode == 4:
>> > +            self.status = SelftestStatus.SKIPPED
>> > +        else:
>> > +            self.status = SelftestStatus.FAILED
>>
>> Using this class-based pattern requires us to do
>> Selftest(test_path).run(). Would you consider using a function-based
>> pattern, like run_selftest(test_path) instead?
>>
>
> I find current class model provides an easy way to group data in
> hierarchy. For example, test_runner has list of selftests which it needs to
> execute. Selftests have their own test command, output data, result
> status, etc.
>
> Both are suitable to implement runner. But I am little hesitant to
> change it now considering it is already written. If you can provide
> benefits of using functions approach here then I am open to
> rewrite.
>

I think the classes approach introduces more boilerplate which isn't
necessary. I don't think there's any state stored in the classes and so
this is a good fit for using functions. After removing the boilerplate,
we might actually be able to put everything nicely into 1 file! That's
not to say classes can't be in 1 file, I think we're more used to
classes being in separate files.

__main__.py is already mostly in a non-class style, which makes the rest
being in the class style more jarring.

Most of the kernel is C which is mostly procedural where you need to
implement your own OOP, so I wish the accompanying python would follow a
more procedural/function-based style rather than directly reach for OO.

I'm also heavily influenced by Jack Diederich's talk [1], which is a fun
talk but may be too long to watch, so [2] is a text overview.

[1] https://youtu.be/o9pEzgHorH0
[2] https://szuckerman.github.io/stop_writing_classes.html

I guess this might be more of a philosophy/preference thing, feel free
to go ahead if others express preference for the class style.

>> >
>> > [...snip...]
>> >

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
