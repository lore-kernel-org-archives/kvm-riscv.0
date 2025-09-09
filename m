Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF208CAC587
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlmuICfWR8QmHhUZaRonqmIgNQYEL4yJYBSDbDLHRD0=; b=SJt+IpubSZDisz
	umRBqvH/PjwKpH3jN0dondLMeQcG4A1i+fe6J2pt+BRaG2cor6wz/VM+QeMKaaoyy0g2mT15UfvHo
	Jc3g2JBvU0h4WXhEzJEGwU80ynfTexsKFraRLBYTiSv1ZkybvGoNKzS8+jtApul2GsWUPBULV1Hwq
	vbFbZjYKNykQdcmmDx318G3GHXN0POmGyMdS856KLMMK/GzW2p6+h3G9d0rv8q6cfe1IwmDp0EKRx
	19HUxJOcZgB+jLb/7i68wPdJitceAYDr1V8qTp3kN3LuKOX/F/4J4k+OKuCc/9kAnThzl/QTGWHeF
	Ie0QQwsRdERMy60rGDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsJ5-00000004yV2-0bbF;
	Tue, 09 Sep 2025 06:58:23 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqb0-00000004MFk-40Jr
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 05:08:48 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-60f47bcdc5cso952219d50.3
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Sep 2025 22:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1757394525; x=1757999325; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8v83NhoMV3/Set65PIGiCZnF+wEhzRaTeeF1y4TM/iY=;
        b=OocY08p4SHmjZi4Tv4GVypyfg8ipDbv31gDKWSggWwtzH+INUxzcb6Zi0fFVT69YhM
         BHZvNV20P4dZn9z2vE9hfUTomJObQnHP1NQz05g+zMdwFXx4I7CazJvuRtvGcok57GOv
         w7Xtmv/Ufi1OR5ibvv8j+kYsmLd0ZbuyoWkbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757394525; x=1757999325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8v83NhoMV3/Set65PIGiCZnF+wEhzRaTeeF1y4TM/iY=;
        b=Nww7ummvq4JdHPPiTSkQO+NUcOuLGNVhpNozCxXt6S6w3qBBYhVMVa99jT5kpBBsh8
         T1mRU2T3zQnkDZdAvrY4xiEJyEbDumZHzZSLhpG3amaniIBuP8DJvonGHJnDtu8ZP5RI
         RbqHACSR7DJJykN3/NvxGp9OgjfnYfUWHM7Diw4LTH/4k72EkKa9vQcSXJx4fGz38nui
         92z0GslBMWWdz6dr1I7K0cQzJSG/eLLcTWyUk6Qwqen4BuvBVtJyR0i1nxLijy7zyiZ2
         LRM59ahj620EHG4069SbtwDutbUnKRbwFh8lGzrqbxDEz2rutXmYdvt4sn7HHm5SDC5C
         aG5Q==
X-Gm-Message-State: AOJu0YwPyM58EFwICRAazG78MkgDK2jNq2DFURRPM/wkVXfXRb8CNm6U
	+r4Mx1VNaSE8qQ8gqPeUVu+MNXNHu6plnJMmFzxnMm4G4Atr7chOrYjPqQmn3Rpj65N1t0qymzS
	hQJfK35BoVElp8d9hs3M/3CKFm2rwDBs=
X-Gm-Gg: ASbGnctTykPy0RTqb03mPd3Z00GcG7cxOZFgUqpDpt/bPxgIRqYrgp3Es6cw26b6QM9
	xl5nOJON+ay8XhCybTqo/Y0zTVuwm7HXAptEDi3K/Sg0sBzGPrPwjVnOV80hrflKFeF3wg30oB2
	3nWQyWJ4pL8xxJIx9fZ78v/+9SttzwQqywDuqQmLx5rL/lpwdDINYu3az5VdVtq3gx6sqNrYn67
	JgKV6PV7MmX6wvvFg==
X-Google-Smtp-Source: AGHT+IHkUFM3tIDPd+HCHUsiQaSV2Uumae9Nz9ns0Y9dI67zYpHeBh+7GAWmWM5/jnTI8MgQRVzuAyjRsDPU3DiDOWk=
X-Received: by 2002:a05:690e:250d:10b0:5fb:78c2:b71f with SMTP id
 956f58d0204a3-61032fe7a13mr8005880d50.18.1757394525330; Mon, 08 Sep 2025
 22:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XddfiKcS_-pYwG5b7i8pwh7ea-QDA=fwZgkP245Ad9ECQ@mail.gmail.com>
 <20250904-11ba6fa251f914016170c0e4@orel>
In-Reply-To: <20250904-11ba6fa251f914016170c0e4@orel>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Sep 2025 14:38:34 +0930
X-Gm-Features: AS18NWD7IqIrRLFAZ974tA0j1eH-dJLYx1GRysFMdqkPB52xRhZMNwMvKB_OEak
Message-ID: <CACPK8XcV_zCy7sVeSg+muCQ89ZxuhPPXJPMztSisi_oHgMK_Sw@mail.gmail.com>
Subject: Re: [kvm-unit-tests] riscv build failure
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm-riscv@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>, 
	Buildroot Mailing List <buildroot@buildroot.org>, kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_220847_205543_3E7F3EEB 
X-CRM114-Status: GOOD (  16.65  )
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

On Fri, 5 Sept 2025 at 07:54, Andrew Jones <andrew.jones@linux.dev> wrote:

> I applied similar steps but couldn't reproduce this. It also looks like we
> have a dependency because configuring with '--cc=/path/to/mygcc', where
> mygcc is
>
>    #!/bin/bash
>    for x in $@; do
>        if [[ $x =~ sbi-asm ]] && ! [[ $x =~ sbi-asm-offsets ]]; then
>            sleep 5
>            break
>        fi
>    done
>    /path/to/riscv64-linux-gnu-gcc $@
>
> stalls the build 5 seconds when compiling sbi-asm.S but doesn't reproduce
> the issue. That said, running make with -d shows that riscv/sbi-asm.o is
> an implicit prerequisite, although so are other files. I'm using
> GNU Make 4.4.1. Which version are you using?

As Nick discovered, it was the older version of make that was causing
the issue. Thanks to you both for sorting it out! I'll send the patch
along to buildroot.

> Also, while the steps above shouldn't cause problems, they are a bit odd
>  * '--endian' only applies to ppc64
>  * -j385 is quite large and specific. Typicall -j$(nproc) is recommended.

This is a curious number. I went digging, it seems buildroot does a $nproc+1:

PARALLEL_JOBS := $(shell echo \
        $$((1 + `getconf _NPROCESSORS_ONLN 2>/dev/null || echo 1`)))

Knowing how these things go I'm sure there is some reason they do this
instead of calling nproc.

Less counting perhaps? getconf ends up reading sysfs:

openat(AT_FDCWD, "/sys/devices/system/cpu/online", O_RDONLY|O_CLOEXEC) = 3
read(3, "0-383\n", 1024)                = 6

Whereas nproc calls sched_getaffinity, and then depending on how new
the glibc is will loop over all the CPUs to get a count:

sched_getaffinity(0, 128, [0 ... 383]) = 48

coreutils has this to say:

  /* On systems with a modern affinity mask system call, we have
         sysconf (_SC_NPROCESSORS_CONF)
            >= sysconf (_SC_NPROCESSORS_ONLN)
               >= num_processors_via_affinity_mask ()
     The first number is the number of CPUs configured in the system.
     The second number is the number of CPUs available to the scheduler.
     The third number is the number of CPUs available to the current process.

     Note! On Linux systems with glibc, the first and second number come from
     the /sys and /proc file systems (see
     glibc/sysdeps/unix/sysv/linux/getsysstats.c).
     In some situations these file systems are not mounted, and the sysconf call
     returns 1 or 2 (<https://sourceware.org/bugzilla/show_bug.cgi?id=21542>),
     which does not reflect the reality.  */

Anyway. That's how we arrived at 385!

Cheers,

Joel

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
