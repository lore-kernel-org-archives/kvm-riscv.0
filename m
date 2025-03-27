Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5623CC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=S+BbYh3pMh6i/UXoxVUuIroV+Qyrw6gxrIWfNZ2KlOQ=; b=c903PAoMv8sWxXayWFXYTKFRC3
	QWgT+yX99P4mLprjAsO2vX0lOPMAqlaxIF6nrhprtkeJabP6i8C2qudB5b92lbvwaq+lz/pH8KtdC
	XLUS53Pz98a9eZCCqlcP+imUcnESrb2xeMJft4PRqJc+WGVvfL+SDowXlH87YUZGv/Lr4PheluGue
	8SKuK5cw6+uPMNrFukb2cvrLw+VJe2bfXdC8hLc112pCe/ou0/0X6JLhgNA6JjrTkw2PYl/5H4Dlv
	L9TzXTohStZNQ18upJ0i9lCZ15Zb1sNxH6ftvKYvSjIEjZczAP8n2wLNgFfaHwkxvd1D93QCCDdds
	euomSuPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpyN-0000000BUwS-2VVZ;
	Thu, 27 Mar 2025 16:20:51 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpxj-0000000BUmu-3HVb
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 16:20:13 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225477548e1so25295335ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 09:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743092410; x=1743697210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQcfqS6ONRy4v+VAuw1r1bUFP3B6ufIgzXQvK3yZp0M=;
        b=xLxeBatS/+T03YSO4I8qN7oFAkXITv7OO3yOZz8bFNJaVAvDu7ADeKwmUQxljvuglE
         ktzGqFKIJzSjDDAX4uole1fvOQ0/MoTL0WBKGE9zPimeIR/cVNPbq4U3Uhgt9U8oOWNb
         PqhA7QBAeqdymdtBgZaH/2zHPDkdFI/hQgbEjwzVBwwo1gEG3fSfG63kxs6Ac29dPR+v
         es2VZBDERJkfGtNqa4CxmyW2G1cvoWATtqwbAnXAraA+IubTOzrqCUwQlwz/2I9+AGrW
         pYudHLraDEjN2ghdlWQMmYdeSCaXGFX8U+d6I+Gu48KllxofDxWdcuMSrrERNLP4w3RX
         lGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092410; x=1743697210;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQcfqS6ONRy4v+VAuw1r1bUFP3B6ufIgzXQvK3yZp0M=;
        b=SCdXDwvF5e8gv+Pt6+emTiHktImJgUylRDZf4qL5VoE3wRnGFT5zv/3heiUnDHfyfm
         dLtoVc8Bmu3NOJxW89iylsCugceWXiD+75IxWqTjENgZFhvynm0yb+ZNRmaS4drgWuda
         SKdjn0MLqhAznWebIscH2CBO7xuxCNUe3KBvsMCNuaNqdAN7bFR+nM5uCdcEc91HqTLk
         tbuRki4GLMR1ixZBNKbmQPLqk2kKXvbWQmq2SnAbazBoBsCAr3C+BYjStE/2fXrTvesC
         DIX8T9f/2tyFjq2Ofnay2YruJvOAdrxyjBRPnMuR9hPkul/XO03S2s2ljYjVjpWnF7Ig
         FUBw==
X-Forwarded-Encrypted: i=1; AJvYcCVbwyPl+xG4mxsbP5J/9EHXI+nX0vIfxvo1OzUqmyO2kRIlg1Dkm6k8k7UMYF6mL2IafAnNmWx0rRY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2fvOztv4fMA9xU3ulFG0kFn6IfGsBv/FUkmBcPuYw/SuqOvXA
	kcFCCV4vLOGpXc/a0tOWCr4b0GsfI+aWIyOf4QN8ZjwpNAcqKRm/VL01JeoSHso=
X-Gm-Gg: ASbGncupRBlPcztUktM30kFhu+iFln50AkiPHKqCo/Od7ux/LpU9oOJHdFi1Uh76Ccv
	kRcyHaWyPnQwdwBR5rbbzC+pus1eUEoBItRxvx94HwC4/WW9Ajp1PsMXqqxth65P49QGQsDxnV1
	SJihw8pLLrM7qNJUEXGvNUNZq5uiqlLNR04xb6njYSd2w2D9wyLgL8ncCq7gv2NxNzNnb26RMtG
	eVZI+4FG7UItpjSS6HNJuxFsLPOHwLnMrMobRX5dcVVcZrC+cjm8OoNq0XjY7YRdcl83ZSRBu/n
	qHHIOUprrclHyAch6tb4rGavd6JDHMT6kMwd2Q==
X-Google-Smtp-Source: AGHT+IGhXmi8JOjZOP3Ikj3wo/1uBU9qt49Ql5SLHckRbeVG8HWYg9iWFYIxA94kzN1K7mL9F21TaQ==
X-Received: by 2002:a17:903:22d2:b0:223:4816:3e9e with SMTP id d9443c01a7336-22804857854mr57168615ad.13.1743092410377;
        Thu, 27 Mar 2025 09:20:10 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e4b6sm14534202b3a.180.2025.03.27.09.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 09:20:09 -0700 (PDT)
Date: Thu, 27 Mar 2025 09:20:09 -0700 (PDT)
X-Google-Original-Date: Thu, 27 Mar 2025 09:20:00 PDT (-0700)
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT kernel-self with ILP32 ABI
In-Reply-To: <svu4xdeo7a7ve3vorvgbkjxzrqmqk5oztgtfpbg556wjw4x7vc@yg4esoipmt7g>
CC: david@redhat.com, peterz@infradead.org, guoren@kernel.org,
  Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>,
  Linus Torvalds <torvalds@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>, anup@brainfault.org,
  atishp@atishpatra.org, oleg@redhat.com, kees@kernel.org, tglx@linutronix.de,
  Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, brauner@kernel.org,
  akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com, unicorn_wang@outlook.com,
  inochiama@outlook.com, gaohan@iscas.ac.cn, shihua@iscas.ac.cn, jiawei@iscas.ac.cn,
  wuwei2016@iscas.ac.cn, drew@pdp7.com, prabhakar.mahadev-lad.rj@bp.renesas.com, ctsai390@andestech.com,
  wefu@redhat.com, kuba@kernel.org, pabeni@redhat.com, josef@toxicpanda.com, dsterba@suse.com,
  mingo@redhat.com, boqun.feng@gmail.com, xiao.w.wang@intel.com, qingfang.deng@siflower.com.cn,
  leobras@redhat.com, jszhang@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
  samuel.holland@sifive.com, yongxuan.wang@sifive.com, luxu.kernel@bytedance.com, ruanjinjie@huawei.com,
  cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com, qiaozhe@iscas.ac.cn,
  Ard Biesheuvel <ardb@kernel.org>, ast@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
  linux-crypto@vger.kernel.org, bpf@vger.kernel.org, linux-input@vger.kernel.org,
  linux-perf-users@vger.kernel.org, linux-serial@vger.kernel.org, linux-fsdevel@vger.kernel.org,
  linux-arch@vger.kernel.org, maple-tree@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
  netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
  netfilter-devel@vger.kernel.org, coreteam@netfilter.org, linux-nfs@vger.kernel.org, linux-sctp@vger.kernel.org,
  linux-usb@vger.kernel.org, linux-media@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Liam.Howlett@oracle.com
Message-ID: <mhng-e8248074-b79c-42f6-986f-9993851b6be2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_092012_059353_EAFD63E5 
X-CRM114-Status: GOOD (  24.00  )
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

On Tue, 25 Mar 2025 12:23:39 PDT (-0700), Liam.Howlett@oracle.com wrote:
> * David Hildenbrand <david@redhat.com> [250325 14:52]:
>> On 25.03.25 13:26, Peter Zijlstra wrote:
>> > On Tue, Mar 25, 2025 at 08:15:41AM -0400, guoren@kernel.org wrote:
>> > > From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
>> > >
>> > > Since 2001, the CONFIG_64BIT kernel has been built with the LP64 ABI,
>> > > but this patchset allows the CONFIG_64BIT kernel to use an ILP32 ABI
>> >
>> > I'm thinking you're going to be finding a metric ton of assumptions
>> > about 'unsigned long' being 64bit when 64BIT=y throughout the kernel.
>> >
>> > I know of a couple of places where 64BIT will result in different math
>> > such that a 32bit 'unsigned long' will trivially overflow.

Ya, I write code that assumes "unsigned long" is the size of a register 
pretty regularly.

>> >
>> > Please, don't do this. This adds a significant maintenance burden on all
>> > of us.
>> >
>>
>> Fully agreed.
>
> I would go further and say I do not want this to go in.

Seems reasonable to me, and I think it's also been the general sentiment 
when this stuff comes up.  This specific implementation seems 
particularly clunky, but I agree that it's going to be painful to do 
this sort of thing.

> The open ended maintenance burden is not worth extending hardware life
> of a board with 16mb of ram (If I understand your 2023 LPC slides
> correctly).

We can already run full 32-bit kernels on 64-bit hardware.  The hardware 
needs to support configurable XLEN, but there's systems out there that 
do already.

It's not like any of the existing RISC-V stuff ships in meaningful 
volumes.  So I think it's fine to just say that vendors who want tiny 
memories should build hardware that plays nice with those constraints, 
and vendors who build hardware that doesn't make any sense get to pick 
up the pieces.

I get RISC-V is where people go to have crazy ideas, but there's got to 
be a line somewhere...

>
> Thank you,
> Liam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
