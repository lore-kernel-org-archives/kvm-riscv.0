Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD79FCCD183
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXL36psy4Vi4SSP/3UD8uhAw5GarcCoO8heic1gYdPY=; b=whyXToiStSMPEu
	Hnosj6duTmKIz2AGORjA0oZRRp9C/ZSoV50a64Aq6er4VDJk0WCllJO6SRREoiaYpbw/CFhF3OlhJ
	AbGgJ6LlnzMzJHo+rZrALn568H600sYWBce1tENCF6NFpYaOcCSUbX5wkiRYY7e1R7g89dPipUmRE
	Q6eJ2DuNi2cV0q7kfVvCxP4rm2OH8yyVq0eTt4YkpthZq6nNZJYETyL2F/OLzei23UAPA/03NYFet
	jgzJr02/n1/aTwsH9aB5qBAG/7o7THUe1i5J/Va0AlO3zEB/IknC2Q3MKbeaOMPS/etnGutbc1dzT
	I7O/VfVdLBFddClNnMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MQ9-0000000E2xr-1usR;
	Mon, 13 Oct 2025 17:33:17 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MQ7-0000000E2xH-1BsP
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:33:16 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-42f6e0bdcf7so37696395ab.0
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Oct 2025 10:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760376794; x=1760981594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ayp48MZbN5Cs7nDgCISLNME6zNhdXoMazjFmWcmYUGc=;
        b=nWNt3Gaw1D8rowuv5lRs75ckuBJ/gtSixzg88cBx6uLHAlL4OOhtdPx9YWBHEJhZPg
         tKHnhN2sNDtprDl37LfnZrtxShTwc0y2sedpv6nh2bPQBawiBt5fgC7sBvkIekSNdWia
         HRuRrQyJj67HOIQO15yKV35apTHnOM5sZhYvbCEkss1VoZHk0lhxG0MFqelRvUpBBrdH
         S54+eWLZvb39Y0bjeeA7BSkVKxul4WPZR2BOyvDitNF0z+BonwNCbhkQlX12bzJ/DaHd
         g9Cvo+SI8y7v4GO6zEwSN/j/V+URibD3pN6MPcr4+mIv7KBgqRHJuLNGROQxBnaPjmb7
         ayrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376794; x=1760981594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayp48MZbN5Cs7nDgCISLNME6zNhdXoMazjFmWcmYUGc=;
        b=G69BmZlo1dzpbtMN6MCIf81iM0305GfvlNhulx8KdBDQcxm7wB9+x7tH1zpMO6jyiG
         SIxPQ6MnKflPAr3QmzcMdsWYzVCSw0G0gMD8xGczy+ER2mjPcgTADkSaUIm8gr2mw3L+
         4yiXvh/eAHdEJ5aq6iV+xkYSfDiInGPpapLaGAHvrY6SWGdgDRLZiJggXfdySXRsDlp8
         azlnRZwbyTKjNm8wdXBvOmllzvJkl297EkrWRyDj26GuzKl0Xqy7Rhb+4EZqgSHWGgH3
         hA5w83fWoVjrPQ99kdSkj+T0WfLa4EyNN+J/tqA9QSc5g8ZMbap5Yubx+0Sfi22CnN5Q
         qUuw==
X-Forwarded-Encrypted: i=1; AJvYcCUBGMlLhp5M1nQX5qwuz2iCpGdVGpie3ZSISl2qsTJ0iDTXeU81tZjyaQ5RClAp/kKBiGMGWLy2Ao4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfDyFbys50ScBYO/V6vzB84DyV6mgYJItnEeb3oB+M94ZATCr2
	5oQMHGn8g83j0UYvoEj1gqfzRENghRFjF7DbYh2Nhl1dS+QBBs1yCcVi704YwpQ4R/M=
X-Gm-Gg: ASbGncuB7mAlZZ66QtFkIMOHNDtKMmwJS4UFqnlQLaW05CkIJOKv0X5aSVqSCgjIZl7
	+z8s07DA3zvN2xkr87TLt2tdANsQzFCGHIfywMbFfUc9ZpbG66dF2QQiGpXSJp7uyr8MFhm7XZP
	PGZQb6uTEp4nzYdR5S2NZgltBQ3QNUa3Vs9RUdex/tuJJCeVlBjneD0l26A8Di5bcnyKND5HkZz
	z0rGj5a6AXZN6Fme0HaIzGov0ucLRjeO4B4800JmUZ0NN4nVpiQNaxlf0sm2SAYoyRNWZao4Z/O
	CgDcd8iBlKg8ANbvjMbEGVjgael4Cum+oznxa/b2SqGyQDD91cfqi3N96DCNaerMkReo+sNHeV+
	Oam3WBxqCjWTPM5lzGGBAJzoM3kVNK/pkqsa+sjVoaQI=
X-Google-Smtp-Source: AGHT+IFDazSLroLydtk5cH1KILqZ4Iei26upSUEwKCXzSVpVsXNoIQpkXulTHXzkWEj/yRrHFf3q1Q==
X-Received: by 2002:a92:cd84:0:b0:42f:952d:962 with SMTP id e9e14a558f8ab-42f952d0acbmr188390205ab.0.1760376793773;
        Mon, 13 Oct 2025 10:33:13 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f729ce076sm3876957173.55.2025.10.13.10.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:33:13 -0700 (PDT)
Date: Mon, 13 Oct 2025 12:33:12 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org
Subject: Re: KVM: riscv: selftests: sv39 support needed?
Message-ID: <20251013-a4ac567b70f3d5f4aab4052d@orel>
References: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
 <20250918-618ded295b364b5aee7d17b2@orel>
 <305003be-8f8b-47f1-bbe6-17c547eb3725@163.com>
 <20251009-fbe27696dc9ef50de56c44d3@orel>
 <56cae42e-158e-47e8-ae94-56b2e0a84643@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56cae42e-158e-47e8-ae94-56b2e0a84643@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_103315_351346_566320D1 
X-CRM114-Status: GOOD (  45.96  )
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

On Fri, Oct 10, 2025 at 10:11:47PM +0800, Wu Fei wrote:
> On 10/9/25 22:40, Andrew Jones wrote:
> > On Thu, Oct 09, 2025 at 08:40:03PM +0800, Wu Fei wrote:
> > > 
> > > On 9/18/25 22:13, Andrew Jones wrote:
> > > > On Wed, Sep 17, 2025 at 10:11:05AM +0800, wu.fei9@sanechips.com.cn wrote:
> > > > > I was running kvm selftests on qemu-system-riscv64 with "-cpu rva23s64", which
> > > > > uses sv39 by default, then I got the following error. After some debugging I
> > > > > found sv39 is not supported for selftests, should we add sv39 support? I can
> > > > > prepare a patch if it's needed.
> > > > Yes, please.
> > > 
> > > 
> > > Should we add another mode as VM_MODE_P41V39_4K? The smallest VA is 47bits
> > > on the existing modes.
> > 
> > Why P41? sv39 supports a 56-bit physical address. To support sv39 I'd
> > expect to add a VM_MODE_P56V39_4K. And, afaict, the reason we don't have a
> > VM_MODE_P56V48_4K is simply because when riscv support was added it
> > didn't add any new modes. We could VM_MODE_P56V48_4K as part of this work.
> 
> It's about mode for guest? Which is also limited by hgapt.mode, suppose
> hgapt.mode is Sv39x4, the valid gpa bits is 41.

You're right. I forgot what the PXX meant in the mode, but reviewing the
implementation for Arm has now reminded me. Indeed we want
VM_MODE_P41V39_4K.

> 
> > 
> > > 
> > > Also, is it necessary to add mode for sv57? Or we can just use some existing
> > > ones such as P52V48 instead.
> > 
> > We need new modes that support 57-bit virtual addresses to test that
> > support, and I'd like to see that. Again we have a 56-bit physical
> > address, so the new mode would be VM_MODE_P56V57_4K.
> > 
> > > 
> > > > 
> > > > > # ./arch_timer
> > > > > Random seed: 0x6b8b4567
> > > > > ==== Test Assertion Failure ====
> > > > >     arch_timer.c:73: false
> > > > >     pid=144 tid=146 errno=0 - Success
> > > > We can avoid errors for the default case by adding a
> > > > kvm_selftest_arch_init() function for riscv which calls
> > > > guest_modes_append_default(). We'll also need to modify
> > > > guest_modes_append_default() to configure the default using information
> > > > from KVM that can be obtained with a get-one-reg of the satp_mode config
> > > > register. OIOW, use satp_mode but otherwise just mimic arm64's setup.
> > > 
> > > 
> > > Is the current kvm_check_cap(KVM_CAP_VM_GPA_BITS) equal to satp_mode,
> > > 
> > > e.g. gpa 41-bits always means 8 in satp_mode?
> > 
> > No, KVM_CAP_VM_GPA_BITS only tells you the number of physical bits of the
> > host, which dictates the maximum mode you can choose (see
> > lib/guest_modes.c). You can get the maximum satp_mode with get-one-reg
> > RISCV_CONFIG_REG(satp_mode) and then use that or anything smaller than
> > that for the mode in the test. See lib/guest_modes.c again to see how
> > there's support in the test framework for looping over modes in order to
> > run the same tests on multiple modes. To do that, the test will change
> > the guest configured mode with a set-one-reg of satp_mode.

I'm wrong again here. We don't need to use set-one-reg for satp_mode and
it won't work (as you've pointed out below) anyway. The guest should just
use the modes we tell it to use. More about setting satp_mode below.

> 
> Got it, just check the difference of the two methods:
> * KVM_CAP_VM_GPA_BITS - value from hgatp.mode, which is set during
> kvm_riscv_gstage_mode_detect(), represents the hardware capability
> * RISCV_CONFIG_REG(satp_mode) - value from satp_mode, which is set during
> set_satp_mode(), decided by both hardware capability and kernel cmdline
> 
> It looks like current implementation tries to ensure vsatp.mode equals to
> host satp.mode (I don't think it's necessary from spec point of view), so
> that only one mode can be set for guest, in kvm_riscv_vcpu_set_reg_config:
> 
>         case KVM_REG_RISCV_CONFIG_REG(satp_mode):
>                 if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
>                         return -EINVAL;
>                 break;

Right, the spec doesn't restrict the guest to the same mode as the host,
just to the same or narrower. We could relax this check. Of course we
have to trust the guest to do what it's told, not what the hardware says
is possible, anyway though, since satp accesses don't trap. With that in
mind, a VMM doesn't even need this set-one-reg to configure guests since
it knows the maximum width it can describe to the guest from the
get-one-reg of satp and KVM can't do anything with a mode set by the VMM
anyway.

So, as said above, for the multiple guest mode tests the guest will just
need to set the mode we tell it to set.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
