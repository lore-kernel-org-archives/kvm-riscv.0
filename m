Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9538BEFCE53
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 00:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqmIL0QSg0+RLRgUrwGqPOttycw7cOb8k6sdZ7l55j4=; b=iP75UZrfkc4oKX
	VRQRL7xih9HC/6+LRxwqsSjAVdDHEo7kTI/NDhiN71uxTCfsX5BMINjLYYIKphlhd7UxZ5HBbsaDc
	8UgJlY/ZSioWYiNLUJ0lpJZkE0hrh7owJPgu62EQN4yxnoIGf9rDmEcuJtEWF/uJRQHBDHalD+T2g
	zz2MvE4LhhkWQa7qbHcjPvjEgWay/1Scp6VPGe/aO5U6gwtPmey7vaiDGk6aKgIh3qNQxDy7cMTwy
	ihhYWLggrvmIQUFzwg63nEwHUbFxQbMpCOFq7P7fqaLGpCRPmHYaexGPMlr69+Ec+jUMMq/4MqMX1
	CiDcqWmpQbufThEWxpyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx2s-00000000ikF-3NVb;
	Thu, 05 Mar 2026 00:58:30 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxx2r-00000000ijH-0OUc
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 00:58:30 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-126ea4e9694so3573588c88.1
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Mar 2026 16:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772672308; x=1773277108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V18G0dffShMU4z6G97+zCQkLAwnQ6V/WEvHOERsnHVY=;
        b=fvP1p8IASV5xNoUIOn1pbR0JjK5WpnVefjOxu4O1jS3/0itqAlu7Whw8xlrWsPa8X9
         scBlI7a6AzkwaYDUAXRZHdETgirlvDAbr+nZvK1BLU7NIaAsSmsPX3UEDhxn9Qknu+ZC
         UCOUL6tb0aByZ1d1oDzWO4kEyPg5FgDrVXD2d/GB+oeATP4KxNv4etyO38RAXyZp9kGs
         kZNfZQ4o1f0+3IvK2f6bz+iusPQ9odw4Ujt0PlOteXLvmY9oCSo0kqdDyT3G0EYXtKO8
         zRSb6xCYYDH8Js1rQ7ccu5A74uwYPwSw+CmuITDB40JXvC64x70p9lzpizi3xQFFHIbF
         sqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772672308; x=1773277108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V18G0dffShMU4z6G97+zCQkLAwnQ6V/WEvHOERsnHVY=;
        b=s/7VdVADRuTCq8OQ0zmZDgfIen3xmhytXkWoNUrVm1yB2OPOB5RySw5Xpwxu2las2q
         cKRMZTa15Z7k7tuFGsgf1lXw0mnsg9TNgW3BxEfNRKbEA0jH798NVEu+HE/rbrvw4mNc
         qLBDdlJjjAMXVO0si4FDINB1FpWf1fBqunqoZssB4mfe3TpYjWEMtOIJ/CYCE0V/nJA1
         GMrSFsKUt4chMWiBp57jcWlAQIan6uptc1gFHIBF8zQUt5IEnfynEDHhwGvqQAb4r/yb
         SUWINGHqyM6sW/hLkqz2WU4KJW7cI9sWkRkYIzPc+stPD+LO+eBEl3YGYA80Fc7tDBn0
         3BDA==
X-Forwarded-Encrypted: i=1; AJvYcCUCuQ/nc2sqLzYoES7EbvW6DVyeaM4WMhQwYBJQgFn718yrM0JtkUtgfmcNurrETCJFI6Ok/w3lQoM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8dbNi7uUYb7kGTynewcha2aAc73IfMb3Vh8bpoCEyhH3uAlTy
	SUkXxPSHEPJn3AXLVJx5hYgyols/4V2wVwH/mDC4UmzU1z7PwUli8n/v
X-Gm-Gg: ATEYQzwM3aUiCJ3GCHO75h57/liwK9NoCNp561z1OTiBjxSREHB84j9ZTMShHqu5Yd8
	uHBwtLVouBAIDNlOADU8pNlf1c5hYVjq3BfAANRKGvw+1yzYNScDMnHxVXt1edm0yqXnktHdagu
	PpldX6ciessoTVL+s+6Lm1e9MjAmDGIT7SZ0MQWT9ae0D2aTRRYRKg/m5scdo+1hAJcz2+feJsa
	VFfahSKegNR9PmFWvIDB2EHsu33WUK9RV9wdY3x38o7zGHImNTP3q016eG87D1QOn81ryRpcQqm
	4tiLgQ3+np6oZC0DqM6vAF/YdkzCFqU7gxvLWE135TkNQZNi0LOIacxo4YFrOpShORw5ViayZEF
	n08NYkMCzExAz+FLdzjD5uR6nj5j5xj0kqjesPDHT7Grpq+zyrD4a2GA/f37qO53fF7Jz4Iu370
	9qrODZrAZKGj5ol9DRNF9++Yk=
X-Received: by 2002:a05:7022:525:b0:119:e56b:9590 with SMTP id a92af1059eb24-128b70d11bdmr2303907c88.21.1772672307447;
        Wed, 04 Mar 2026 16:58:27 -0800 (PST)
Received: from inky.localdomain ([2601:647:6700:64d0::5c10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be381d5ae9sm1164212eec.26.2026.03.04.16.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:58:26 -0800 (PST)
Date: Wed, 4 Mar 2026 16:58:24 -0800
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guodong Xu <guodong@riscstar.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 00/11] riscv: hwprobe: Introduce rva23u64 base
 behavior
Message-ID: <20260305005824.GA132269@inky.localdomain>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_165829_134322_678341ED 
X-CRM114-Status: GOOD (  23.89  )
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

On Thu, Feb 05, 2026 at 06:23:38PM -0600, Andrew Jones wrote:
> Users need a way determine that their harts conform to rva23u64 that
> isn't error-prone. While patches 2 and 6 make it possible to determine,
> it requires a bunch of probes and checks themselves (see patch9 for the
> recipe). This RFC proposes adding an RVA23U64 hwprobe base behavior
> (patch8) allowing easy determination. It also proposes adding the bases
> to /proc/cpuinfo (patches 10 and 11) -- but those two patches are probably
> even more RFCy than the hwprobe proposal...
> 
> The first three patches have been posted previously by their respective
> authors and are currently under active review (except patch2 which
> appears to have gotten lost in the shuffle). I've collected these
> patches into the series since they're necessary for the base and
> because I wanted to repost patch2 and patch3 with some changes. patch4
> and patch6 expose more extensions to userspace. patch9 adds a consistency
> test for the new hwprobe base behavior bit.

Great series! Thanks for pulling these all together, I like this
direction. We had dropped patch2 because we were using it for some
misaligned access optimizations but then realized that the extension
wasn't useful for that so then the patches got lost.

In Linux 7.0, patch 1 got applied along with CFI using the first flags of
the second key so there is some rebasing to do.

I think putting the compatibility info in /proc/cpuinfo is a good idea.
There is always hesitance around /proc/cpuinfo because some ill-advised
programs try to parse information from it, but it is nice to have an
easy way for users to see the compatility and since you also added the
hwprobe interface for it this seems reasonable.

- Charlie

> 
> Thanks,
> drew
> 
> 
> Andrew Jones (8):
>   riscv: Add B to hwcap
>   riscv: hwprobe.rst: Replace tabs with spaces
>   riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to hwprobe
>   riscv: Export have_user_pmlen* booleans
>   riscv: hwprobe: Introduce rva23u64 base behavior
>   riscv: selftests: hwprobe: Check rva23u64 consistency
>   riscv: /proc/cpuinfo: Add rva23 bases to output
>   riscv: /proc/cpuinfo: Also output rva20 and rva22 isa bases
> 
> Charlie Jenkins (1):
>   riscv: Standardize extension capitilization
> 
> Jesse Taube (1):
>   RISC-V: Add Zicclsm to cpufeature and hwprobe
> 
> Paul Walmsley (1):
>   riscv: hwprobe: add support for RISCV_HWPROBE_KEY_IMA_EXT_1
> 
>  Documentation/arch/riscv/hwprobe.rst          |  42 ++-
>  arch/riscv/include/asm/cpufeature.h           |  14 +
>  arch/riscv/include/asm/hwcap.h                |  23 +-
>  arch/riscv/include/asm/hwprobe.h              |   3 +-
>  arch/riscv/include/asm/switch_to.h            |   4 +-
>  arch/riscv/include/uapi/asm/hwcap.h           |   1 +
>  arch/riscv/include/uapi/asm/hwprobe.h         |   9 +-
>  arch/riscv/kernel/cpu.c                       |  38 +++
>  arch/riscv/kernel/cpufeature.c                | 168 ++++++++++--
>  arch/riscv/kernel/process.c                   |  12 +-
>  arch/riscv/kernel/sys_hwprobe.c               | 249 +++++++++++++-----
>  arch/riscv/kvm/main.c                         |   2 +-
>  arch/riscv/kvm/vcpu_fp.c                      |  28 +-
>  arch/riscv/kvm/vcpu_onereg.c                  |  22 +-
>  arch/riscv/kvm/vcpu_vector.c                  |  14 +-
>  .../testing/selftests/riscv/hwprobe/hwprobe.c | 112 +++++++-
>  .../selftests/riscv/hwprobe/which-cpus.c      |  20 +-
>  17 files changed, 610 insertions(+), 151 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
