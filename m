Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FC0CA0EE4
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8qG9n0LeNzZ9XzQyhmNjQP0Go6vQmrNMZakhGAuLIc=; b=wXCKuwsQGlmK7G
	zFkDEGOKrKmTRxl32UbVhGvK6v5zzFNbsxnSPmAan0gSudyT1rY8eQyqJgK7UM32Qw7vXfa9A3mCw
	lCBwJIjUeG1RaK4odSUgFZgww/zAbPrq7ITOmUs6zsQ6jshH4A34wrm5lTp8yBzK0dJ1snP9Bqup9
	s1bB/K9H2SpDkxIrc3CqYHCMKX96xbKJWvZx8muX2f+Is1NiJQKMWuWKkiqTNhsMelptXVU+jW7yo
	VFKzz1lmGuZm9M8gTRFr8GnM56sodKKytajcHkDlm7h1vDAntBa+KQoaZwWVVbpIfG4e/wb7Gjzbq
	EUjVlvfCz9EeY9/1Y0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7QU-00000008k4x-451u;
	Mon, 18 Aug 2025 21:29:58 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6yk-00000008gep-2Vgb
	for kvm-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 21:01:20 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-88432cbdb8bso36085839f.0
        for <kvm-riscv@lists.infradead.org>; Mon, 18 Aug 2025 14:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755550877; x=1756155677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3nZTzF2lhsZGOWdY8YDL7P1nyHVBb5WBP5wnL3mixY4=;
        b=C5hODIKxGYC13BgTZj3Sl/FM+Q/aslwPtukZVfORu/YowL/7SsOml6KsRAtN8iB5Iq
         Hxu0CWkVK5YczCDJ7TiFAwDGG+Y3u/M0evsiZsxt87krFmRzsm+mjeQOAirMqXL7y1hq
         o/YBydUYXeZv+sS7Dxlau7vAMPTyAYV54VhS1swksvucH5z26RRorjFuYJTlYynV+1he
         fj+1IU1Ouwo7QrMiO7MSp5n1pfAVmjKa7t4R4NoLEV6DQ1wmhnnIyyyvQNfw1mKlOxri
         qhKFCQgIbsP4NitG+ohr3lzx8IRK3V7yT64loOQhkqrBZyaH5D67GZhPEdClYHKEJEPd
         d/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755550877; x=1756155677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nZTzF2lhsZGOWdY8YDL7P1nyHVBb5WBP5wnL3mixY4=;
        b=G10Qh3SeEQbkV/1mTqXOG3dFRFp9RV4R7Z8CL0dcVdH0q0p1tLW3W/B6Mx8NN3Ymf0
         DzGrRWekKBCNWxShH8kQd+HpkQcly9dptf0QUg4ZnRTugUZXxR468djywIFIv5AmhPpR
         z/tAJ8uLE0SXyj67PWOMSlXvQGvFwgEQD5HMGj0y9AoBXPdYkQvIk6G4MD9fM8uZ3pkw
         0nHpt12WUNFJv7QvbgeMHm/AeWAa79byrxMMaSK/N4HrWLRafBsLQzJQt974EPGtRHQy
         4+CkxhvR2X+DwPJIa8rqNr8mKo5udbd9XsxiN4r1OBErpUz0FAfNaSkSWTuhyW4kVUbg
         +Ztw==
X-Forwarded-Encrypted: i=1; AJvYcCWiUXJ0AuOo1FmhPADhgNO3FBqM28jILosh06XJtsq1G2C+40byKjEcb15tF4UEqKuWOwDMxKgxcT0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPUewgfE3pKGy1ASeefU0UdQge5RKV+8Rg50kY59why5LFL9nY
	0rHex+AVnhjy/GcMAN2D1eBnrsrBE7IKmUBa1QNlFxbIaRaFGZNj37KST+F+z+PeAHk=
X-Gm-Gg: ASbGncvZn5K7iPiMVcBegqSHrnOXOT9EBeXJyPQJfaWtoYgB4iw6t1jwdRQ2tMO6e5C
	bTS73llz9qXsc+Bg81bXE/A91tKfYNh0q0LY+Q1ArUJ/C50yZBsRrxtmeMDR7uvIOABIJGtg5xN
	DQOydEeE0JPs0TVUILpYoqKt8QJMe3rJhd+5z+Ct0vq4nR/mOeN9X/aXxH4w7CV7sW30n7AckEt
	ll9ZjtDbLTXCOpWS0oUH9HQhq5fdh5QgOFPrnHz20km43K/rVFs9ztlP4PjAmehr4Djk/vsLCuO
	u4bpYlzd4GGuZc/8bbBwmVQeEfG6Ayrk9X4GczqGDIejBh9TkGQjk5UmDITZJj4GxklpxztAEoB
	qybbw5tXHxJWOQq7sOEuCIWA6
X-Google-Smtp-Source: AGHT+IFFpFqrnNZItu3L5GNLWSB269pADqOsIU+gIQEJhNsMNbkPMIMecR7fgqDGFDi8X/YtnL7Gbg==
X-Received: by 2002:a05:6602:2cd1:b0:881:87ac:24a with SMTP id ca18e2360f4ac-88467ecf75amr19364539f.7.1755550877544;
        Mon, 18 Aug 2025 14:01:17 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8843f9c47f5sm345226739f.20.2025.08.18.14.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 14:01:16 -0700 (PDT)
Date: Mon, 18 Aug 2025 16:01:16 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: dayss1224@gmail.com
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v2 3/3] KVM: riscv: selftests: Add missing headers for
 new testcases
Message-ID: <20250818-4672b703d0bf9518ee1d4162@orel>
References: <cover.1754308799.git.dayss1224@gmail.com>
 <cafaa0b547d4a1fc45a38753038c011ea7201d04.1754308799.git.dayss1224@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cafaa0b547d4a1fc45a38753038c011ea7201d04.1754308799.git.dayss1224@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_140118_639023_E47EB3BF 
X-CRM114-Status: GOOD (  17.02  )
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

On Thu, Aug 07, 2025 at 10:59:30PM +0800, dayss1224@gmail.com wrote:
> From: Dong Yang <dayss1224@gmail.com>
> 
> Add missing headers to fix the build for new RISC-V KVM selftests.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Dong Yang <dayss1224@gmail.com>
> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 162f303d9..4cf5ae117 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -9,7 +9,9 @@
>  
>  #include <linux/stringify.h>
>  #include <asm/csr.h>
> +#include <asm/vdso/processor.h>

This is fine, but...

>  #include "kvm_util.h"
> +#include "ucall_common.h"

...this isn't correct. We should instead add this include line to all the
source files that need it:

access_tracking_perf_test.c
memslot_modification_stress_test.c
memslot_perf_test.c


Thanks,
drew

>  
>  #define INSN_OPCODE_MASK	0x007c
>  #define INSN_OPCODE_SHIFT	2
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
