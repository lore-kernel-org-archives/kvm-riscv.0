Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE2DC36011
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=BWZsu57s2LDcW96HdCuNHq06sT/K/J9fLdiFQBSWmKU=; b=GoHe/0uS4kxz1Fu3KK7DApnwUX
	KMb6gW5Kd/9wVJJAI2XjmsoEPBhO18DuSN/8KEQxbTmc7kPy72Cb7WY2Rrag9IvAfCJw14ds5RJy7
	5XyDJm8dyK7CBpF9s+qsWqvYSR9MXlSu181V4kM9DuUk7eEKWS/WMN9A7DPikyJOE6W6YlYz1Hjf2
	w9SBO4/vqE0mDdailskURP3Tz6EKlivC22T7HYY2JQSQvNfdahad6Y6Hgs6e1GHKt7ZFGd0LlNSPx
	zkENlJd8ZzTFt4TksMe76qDLDMHrNGCoI7aa4fBvrMMqGZHq97LfYVM7poNiClKZ7/97XPE6x5h3H
	tmM0KtYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpyP-0000000BUxE-0XA4;
	Thu, 27 Mar 2025 16:20:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpxk-0000000BUnc-2nc3
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 16:20:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22401f4d35aso28668865ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 09:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743092412; x=1743697212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kX05jx75Xb8+ENPYRjK+Gc3Ht1e9kjVMOGIod7/HdTg=;
        b=I3OOx2LDFaiXhxdYk2FfPSYtRt0Z20HXUaxE7dXZHIfHj6Iqmuzv1NoN6LBc0Uk8Ra
         7+f8SGUpdGc+/1OV//xZmWaklMa5vRGTGKaDiyekTnxWXspTRmlqxs0I3+CZuti+oWIx
         MUAla7AtO5TcwcDYS8hneaq83RpXdhN+m6FZ5cVDKeKHuBkbOYYmSzVlMo+KRDCQ1PST
         rnwqun/iip7LUJF8QdunbKv819sT1EzPgJDr+RUqL311As18H3yMc3bTqVMQKnb4pmfy
         CnbkF+DTU8ps2ctxbei+y1NIglGR53JRIdpWYA/6LlWPG7L1DS9DwCAdFouEgOgwYN5Z
         6D+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092412; x=1743697212;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX05jx75Xb8+ENPYRjK+Gc3Ht1e9kjVMOGIod7/HdTg=;
        b=nwDn+/eymo+zU6F25rhE+qz1bDPaopmehq4prv1FAdQCRMvngLL33Lyj8UisOHxJV2
         LhJ98zIli5WE8O18CIBYKPl4xTWs64QsfUnHUkZXn/YJ5TK6nLMalWCRQBoJL+V4/nbR
         4pfZjmMTd0EUzCk8NzGpApSPfh2jtehfhAvG77VJJ/otQJ4TXZFWvcMArqdf44Zw7xPc
         mA3hoP2MZC13IEXI6vCmhDmRNlxij7gVPpgN9Ts3dB/3f1woAQ81EybgvgAEM7J6HiZb
         9Tiq9QDIz0FPHc+ibMo3cdecTFKzxfdIdn6SVm1B8VGv9t/AEDPput2y9f3dq9U1KcVU
         WU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbaheii48Ex3hXMLcXwfXd69Y+k6kH9qr4jWru6RWnfoZxYSmS4U6PIhsW/jD47Gb0089XkFZO3SM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj39i5GEJ7R8qks/UJPK85eSc+4ku3gqc6bDh64b2OnpaOyOSZ
	rO0p148UTLsu1JZa65HRrJp/Ltdz9ZrWAv3UvN96g1XCKzKznoLAA9gPGI7IrNU=
X-Gm-Gg: ASbGncs8gpjY/UsUE1qNvWQ4TEOctKKsY7eZs96QPfxzn0nXPTv0RA/yth5M60D31Pp
	CmG7cJcxBMomWR90ag2w8cW1euxtYXeHQePc2BdF3wnhR3M2qlTKwbFQAtvGTFlQHoNJXt9Jnx5
	hTUzli6EENrkyk3pCbF6Y9gTBjx5Rz/uSoNp4XerTTtFWmYOMk33JSDoi5Eqy8Bp9Q8VzIWG5Zm
	tIUXyGsqPnOq6DJkuqJEboZIJsxnrMSiwY5eRIe3TQ4r7v9BZfM6Xc1kL+x0gf43EHasTP67prC
	zT6zPYDO6kQK0FJW4pOk2uRO0ZGUSUtN+FXa2Q==
X-Google-Smtp-Source: AGHT+IGClNJzmnXOK1L/PFNFl5ogZb2gMU/Eqg4X3l9WVxApkZth9g72YE2t9vJ4dK3KZhjxhfYK+Q==
X-Received: by 2002:a17:903:228c:b0:224:216e:332f with SMTP id d9443c01a7336-22804968a3cmr61064755ad.48.1743092411962;
        Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec780bsm1682245ad.19.2025.03.27.09.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Mar 2025 09:20:02 PDT (-0700)
Subject: Re: [RFC PATCH V3 01/43] rv64ilp32_abi: uapi: Reuse lp64 ABI interface
In-Reply-To: <CAHk-=wiVgTJpSxrQbEi28pUOmuWXrox45vV9kPhe9q5CcRxEbw@mail.gmail.com>
CC: guoren@kernel.org, Arnd Bergmann <arnd@arndb.de>,
  Greg KH <gregkh@linuxfoundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
  atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, brauner@kernel.org,
  akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com,
  inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, jiawei@iscas.ac.cn,
  wuwei2016@iscas.ac.cn, drew@pdp7.com, prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com,
  wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, dsterba@suse.com,
  mingo@redhat.com, peterz@infradead.org, boqun.feng@gmail.com, xiao.w.wang@intel.com,
  qingfang.deng@siflower.com.cn, leobras@redhat.com, jszhang@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, samuel.holland@sifive.com, yongxuan.wang@sifive.com, luxu.kernel@bytedance.com,
  david@redhat.com, ruanjinjie@huawei.com, cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com,
  qiaozhe@iscas.ac.cn, Ard Biesheuvel <ardb@kernel.org>, ast@kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
  linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-input@vger.kernel.org,
  linux-perf-users@vger.kernel.org, linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
  linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
  netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
  netfilter-devel@vger.kernel.org, coreteam@netfilter.org, linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-media@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-16d3c75b-cf60-499e-98b0-098d630874b4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_092012_728761_181BC673 
X-CRM114-Status: GOOD (  25.30  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 25 Mar 2025 13:41:30 PDT (-0700), Linus Torvalds wrote:
> On Tue, 25 Mar 2025 at 05:17, <guoren@kernel.org> wrote:
>>
>> The rv64ilp32 abi kernel accommodates the lp64 abi userspace and
>> leverages the lp64 abi Linux interface. Hence, unify the
>> BITS_PER_LONG = 32 memory layout to match BITS_PER_LONG = 64.
>
> No.
>
> This isn't happening.
>
> You can't do crazy things in the RISC-V code and then expect the rest
> of the kernel to just go "ok, we'll do crazy things".
>
> We're not doing crazy __riscv_xlen hackery with random structures
> containing 64-bit values that the kernel then only looks at the low 32
> bits. That's wrong on *so* many levels.

FWIW: this has come up a few times and we've generally said "nobody 
wants this", but that doesn't seem to stick...

> I'm willing to say "big-endian is dead", but I'm not willing to accept
> this kind of crazy hackery.
>
> Not today, not ever.

OK, maybe that will stick ;)

> If you want to run a ilp32 kernel on 64-bit hardware (and support
> 64-bit ABI just in a 32-bit virtual memory size), I would suggest you
>
>  (a) treat the kernel as natively 32-bit (obviously you can then tell
> the compiler to use the rv64 instructions, which I presume you're
> already doing - I didn't look)
>
>  (b) look at making the compat stuff do the conversion the "wrong way".
>
> And btw, that (b) implies *not* just ignoring the high bits. If
> user-space gives 64-bit pointer, you don't just treat it as a 32-bit
> one by dropping the high bits. You add some logic to convert it to an
> invalid pointer so that user space gets -EFAULT.
>
>             Linus

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
