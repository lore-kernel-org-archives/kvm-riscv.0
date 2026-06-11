Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCEBCD98C6
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 01:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	MIME-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jTHl3gYU9fQV/hR6HnjUKjc7ZMuwMBVdgtNTmtexHEI=; b=TJP3TzC/k7IwX8liOdbEpKrWAk
	1NW7neHFHDJTTr2v3Xyql6uTPTc1hvVAUYe4zy2PnHiWwzThiQqH99cswaOMsVOiyDrLnEsPAlWay
	p8+kJO0SdK5W4MrA5tk1LD0wYnzvRM9qH3XBDrjlNxnO3pwT10zbxWrslLbgDY2AFbjA8O6YRZ2UG
	k7CrPxAJzdFChzA8xEkpZdT3C2sgj0lsm5ugeiMrhIUAAZ3OLsQUGfRmy8gpg8SsiaxPjRXkaO+u1
	wUy+G8OAUSqf2u2qncFVNfs3LlHViwZQchY/GSQhjUfZ5SZupl7Y8ZrfY6la+UrfxHFV3lAH2/u5L
	3cJBxS/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXU33-00000008WSC-3Js7;
	Thu, 11 Jun 2026 01:17:33 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXU30-00000008WRi-1x6k
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 01:17:32 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-137ec563a95so9168718c88.0
        for <kvm-riscv@lists.infradead.org>; Wed, 10 Jun 2026 18:17:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781140648; cv=none;
        d=google.com; s=arc-20240605;
        b=FsVYKIeV7YyS4J6Phi4PvSY14BvGT3hZgMSImd4QfWcKy6yhDjjW9LL3mEX/FNJ2M9
         2D7VzRsyMpe7RuWfVLu1tig9uEWhb2+2BYjjb0HLjzq4mtOF32ifhDKJAH/GrwLI/tr7
         uful0hlt3xiU9onRkFZpRapC5HI80aqw9VhACQOj6CL1w2WZ+fZmp+Yd41eg8HYeoq2t
         IWO+dnIaPrPfq0DveIAIokwRzUCfizHXSCEqXa0I+9WSt+ANbwaliAo23aMzlLtEHSGv
         c9MFfXhYyfcypckq29y9iEn6a8+aCY+ft+UVuga5ZXo0VfX6ElJO3nsz7azXDlBC6hFx
         jNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=bjdIvKAE9+v5d05DIespxf4RX/qjcteADqi92OtX9xI=;
        fh=qHXSuZ0eVCtAAqwTm/Ixy2AH7nVXMRi55uKxG3jna9I=;
        b=QraXRVUtRcDucwoBeV4ImaPMR+1F3zgBqvBz+1Ycbz8xD3KvgM/OwI0DzyFPVgB3UZ
         X+ZIHtBMa+Go/fBoLJmuiGkh13kkUTghxkUANvvsje8VDRLAsvlavB1majf8oOH6xg+g
         1NQJuYLkJcq8V+Y/54tw2ThyKrgqMnRSij5jxn/6edRMSHE/+LtU3MTUKz3WF5x3bZek
         qjJweNQ+xyLjhdtzP4xmkAvtUaeDAsIi9sLE77ydTGV4MH+fLkdWhUD4hJ1hLJmpMT2R
         lRhtyRVjv8wC5NXEnQOlFBLd3qW5EaK1tawSzyg6pk6W20WArjcF4QZnibk1cGJw5txD
         BrhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781140648; x=1781745448; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bjdIvKAE9+v5d05DIespxf4RX/qjcteADqi92OtX9xI=;
        b=SofdttXGVf+eW7avsnsV6ljrpdt58nsAX96vdpigZlMxS5mAFVd61SyhCo72N6DNxm
         T8qtOF9mLn5rNBykj4eNDl0hlDHs8FTdPLQUowgUdmWZeCXCos7TNHRTfyjZs3pPULon
         Egq3ep1e1h1ZG9NGWggMKh9NkjAIDemLprWmIFCKTOXDOpEYtKJwxiCJvJRgUBtfe/vJ
         OZUE1GtZOoqqCV2BCcqEeZExU4XDT0+fcJSDVgneAR8rgp37UM4pwtTZJ/BYTXejPTic
         LkmHPRvTgqdNkYtUHejSaW6A7rs1X584wlAENNZzOE48kLkDM8yGsnq+ZXjSfQQc94TU
         DFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781140648; x=1781745448;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bjdIvKAE9+v5d05DIespxf4RX/qjcteADqi92OtX9xI=;
        b=ZkBdo/q0mCeJwz4x8b4EMGBGQjBVmWOn9Kll8oecDKToaX5drw+bcUp8XQmGJUXgDo
         Nfe7hDrn/BT/hBMDJ/un+nVbGRw/NIc7UQQijIkDxCxf0D61MEwl2EKgvjI9ijLo9I0g
         jhyYg9lf/ktL3D8QkY7hYU9B6rONPEaXM/VFwA88xqyrgxvNiHV7PrUO2Q5SV7nZJMDT
         mlL1N7vPiWw+TCPihadLS8qCj/TtX2WyyRfr53y2DnBMQZLJDbM3oRgTtCiAK7AWiAqa
         K/4NfeXpYEsGxY/nvn45QOKt6pfEEK1Vy4KWeGZXOIGevcwNDDKpwlA8cP3ujj+fP1Pq
         L6dQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/ZtQSY0ZHXCe7Amz7gVH7Mi5T5h9gQvdQzW0w7D3w516Cn3B7C05dSCRGIijnGiwUY/umiRhsaXs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdh5xFmosRofADKhYaJ6qR+rs67JOvzojKQz1viXjQ/JssuEIY
	/RaJIwtr1ZeQmims55gsTxEyrXQc5Ju5V/pO2IaKD8twNRDxz2B1MNRzjnS8ZQTGFmei8cO9f/B
	LknpmDUJ8yxPJFISDaQ41/5G3OESululYd0BcSSeM
X-Gm-Gg: Acq92OFXO0B62kvzUqfyngcuBChyKWZb7rUgDX812EDwKvA5XoYUO0sp2JFSzGR9QV6
	5RReH1PVLgWjj3kr5qWmBbr2f5p3WJ7Q07X7To6H24bgH2Lc7TrjPkCxRgRY3cCbBERsZZ6avAw
	7UlrEwolvNGca77IXDQhijfqndD2Fc5kBCN09hXL8lw4zoCDkmIsw0tv0Aa7DfNvRSKYVYnt1wf
	0Q6wWMB4JGkgE9tfrt9nCSiuAlLicAghXKYR4TNwU+z4NRWRY+4731h0xTjVn/jddh9+PKWrzVS
	JadxSa2C7S5bHkc2o+4zPw5tnF3f3biiokseWTfygIQZRqFQYQ==
X-Received: by 2002:a05:7022:690:b0:135:e455:e1e0 with SMTP id
 a92af1059eb24-13842161934mr353073c88.10.1781140647800; Wed, 10 Jun 2026
 18:17:27 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 18:17:26 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 10 Jun 2026 18:17:26 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260331194202.1722082-2-vipinsh@google.com>
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-2-vipinsh@google.com>
MIME-Version: 1.0
Date: Wed, 10 Jun 2026 18:17:26 -0700
X-Gm-Features: AVVi8CdzGmaVWznPyG5AyMjnV1Z4iECS6hmJp8c16LmKO_AaXBZJcKDEnsuZUaA
Message-ID: <CAEvNRgGrPKBXh=VA3QBLJOczKRpMOB4nDmZL0XRwV6B3PT_7+Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] KVM: selftest: Create KVM selftest runner
To: Vipin Sharma <vipinsh@google.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, borntraeger@linux.ibm.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, anup@brainfault.org, 
	atish.patra@linux.dev, zhaotianrui@loongson.cn, maobibo@loongson.cn, 
	chenhuacai@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_181730_539331_0476D33A 
X-CRM114-Status: GOOD (  18.11  )
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
> +def setup_logging():
> +    class TerminalColorFormatter(logging.Formatter):
> +        reset = "\033[0m"
> +        red_bold = "\033[31;1m"
> +        green = "\033[32m"
> +        yellow = "\033[33m"
> +        blue = "\033[34m"
> +
> +        COLORS = {
> +            SelftestStatus.PASSED: green,
> +            SelftestStatus.NO_RUN: blue,
> +            SelftestStatus.SKIPPED: yellow,
> +            SelftestStatus.FAILED: red_bold
> +        }
> +
> +        def __init__(self, fmt=None, datefmt=None):
> +            super().__init__(fmt, datefmt)
> +
> +        def format(self, record):
> +            return (self.COLORS.get(record.levelno, "") +
> +                    super().format(record) + self.reset)
> +

The commit message above says the printing will be in colors when the
terminal supports it, but if I'm reading this correctly, the colors will
always be printed.

I was expecting something like if the output is piped to some file or
like "not TTY" then don't print colors.

Would you consider not printing in color at all? Or adding some kind of
"turn off all display magic" flag?

I also saw code for a sticky footer in another patch in this series,
that's probably not nice for other stuff wrapping this runner.

> +    logger = logging.getLogger("runner")
> +    logger.setLevel(logging.INFO)
> +
> +    ch = logging.StreamHandler()
> +    ch_formatter = TerminalColorFormatter(fmt="%(asctime)s | %(message)s",
> +                                          datefmt="%H:%M:%S")
> +    ch.setFormatter(ch_formatter)
> +    logger.addHandler(ch)
> +
> +
> +def fetch_testcases_in_dirs(dirs):
> +    testcases = []
> +    for dir in dirs:
> +        for root, child_dirs, files in os.walk(dir):
> +            for file in files:
> +                testcases.append(os.path.join(root, file))
> +    return testcases
> +
> +

Sean pointed me here from guest_memfd tests [1]. The Makefiles allow us
to generate test configs at build time. For [1], I could configure all
the test parameters statically or at build time.

[1] https://lore.kernel.org/all/aiHeDZEPkAcWcSkn@google.com/

Perhaps for a future extension, but would you consider taking the output
of some program as input for cases to run?

My (future) use case is that with hugepages, I want to run something
like

  ./guest_memfd_test --order=0
  ./guest_memfd_test --order=9
  ./guest_memfd_test --order=18

And 0, 9 and 18 are the supported HugeTLB orders on the machine being
tested. I'd like to iterate over supported HugeTLB orders at runner
runtime instead of at build time.


> +def fetch_testcases(args):
> +    testcases = args.testcases
> +    testcases.extend(fetch_testcases_in_dirs(args.dirs))
> +    # Remove duplicates
> +    testcases = list(dict.fromkeys(testcases))
> +    return testcases
> +
> +
> +def main():
> +    args = cli()
> +    setup_logging()
> +    testcases = fetch_testcases(args)
> +    return TestRunner(testcases).start()
> +
> +
> +if __name__ == "__main__":
> +    PYTHON_VERSION = (3, 6)
> +    if sys.version_info < PYTHON_VERSION:
> +        print(f"Minimum required python version {PYTHON_VERSION}, found {sys.version}")
> +        sys.exit(1)
> +
> +    sys.exit(main())

This shouldn't block merge: why not align with the kernel's official
required python version?

>
> [...snip...]
>
> +class Selftest:
> +    """
> +    Represents a single selftest.
> +
> +    Extract the test execution command from test file and executes it.
> +    """
> +
> +    def __init__(self, test_path):
> +        test_command = pathlib.Path(test_path).read_text().strip()
> +        if not test_command:
> +            raise ValueError("Empty test command in " + test_path)
> +
> +        test_command = os.path.join(".", test_command)
> +        self.exists = os.path.isfile(test_command.split(maxsplit=1)[0])
> +        self.test_path = test_path
> +        self.command = test_command
> +        self.status = SelftestStatus.NO_RUN
> +        self.stdout = ""
> +        self.stderr = ""
> +
> +    def run(self):
> +        if not self.exists:
> +            self.stderr = "File doesn't exist."
> +            return
> +
> +        run_args = {
> +            "universal_newlines": True,
> +            "shell": True,
> +            "stdout": subprocess.PIPE,
> +            "stderr": subprocess.PIPE
> +        }
> +        proc = subprocess.run(self.command, **run_args)
> +
> +        out, err = proc.stdout, proc.stderr
> +        self.stdout = out.decode("utf-8", "replace") if isinstance(out, bytes) else (out or "")
> +        self.stderr = err.decode("utf-8", "replace") if isinstance(err, bytes) else (err or "")

I think it would be useful to capture stdout and stderr in order that it
was output, so that the output being saved shows everything
interleaved. I think the order could be useful in debugging.

I can see benefits in knowing which was on stdout and which was on
stderr too, so is there some way of having both?

> +
> +        if proc.returncode == 0:
> +            self.status = SelftestStatus.PASSED
> +        elif proc.returncode == 4:
> +            self.status = SelftestStatus.SKIPPED
> +        else:
> +            self.status = SelftestStatus.FAILED

Using this class-based pattern requires us to do
Selftest(test_path).run(). Would you consider using a function-based
pattern, like run_selftest(test_path) instead?

>
> [...snip...]
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
