Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797A0CCF9E0
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgJjwi1wZyyXFUDmxLzPXiRV4Qh8dsIMZfeYjwcho64=; b=uN8cBCFApkc3O4
	QGhkbv6G5aiEuPtfeZnCQiNYKR976UGJVu28FYIjXgS02BOl79EwHHUm57EEi78n5fqLklstm2ttj
	iKDz7qWW60D8roneOjmLKI1cu6TT8PMqoL+uBhVkXZ0FnaAqGbzUqhingdPHexUfJGb59/dwgUmjj
	k0uHORy/zOckd17IdTPZndEvEXRfS0197Fi2Fysx4kBWDga+ejCft089zA/6OVShJZtjOCnu9NiZE
	Asqt9rn6fBzQJKtOUyeocOGIZmrS7Y++1YzqQ/CcJoNmXQYm6abdMd3TmMysNOCXHHH+kq1wXUdJf
	7bhtUf8ezBx9faYQ+IhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCQxA-0000000AdKv-0DK2;
	Fri, 24 Oct 2025 23:12:12 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCQx7-0000000AdJW-3Pa6
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 23:12:11 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b3c2db014easo565690266b.0
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Oct 2025 16:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761347528; x=1761952328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4qshgmZlkIM4+vcn2er+R5ZwtdRF9Gko5Hx8ZyCDhMI=;
        b=m6hpzv+3TYeJJISMBFKIEAmQoQQkyX6+zOQJHrywC9r3lAjiMukanoIHPojISBHBnM
         igr6N6gH/fmhX19Nkm60hhuutmuqRIYrWPkiYpFpWPIIXx7G8HMXBbFiyc9LKLcpkDg6
         oDM9+buf/5TMyejmyHNlAY8IsfirPqt8sV4V3yUwJttBymH9vUefELchFSDxQTybDI5P
         6QSV++p8RPDlF3sHALI1o6+eiKwJX85sDJ3mn0se3DSuB6CxGa8gX7gCMZJ0iQapCP4o
         24wBj/Y3YmyMSh8d9q2bPRn9hVbmpbHwEjIvvpcXbM1Z1+kZ8hsw4h5ad8RNZuSYEinI
         Y3ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761347528; x=1761952328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qshgmZlkIM4+vcn2er+R5ZwtdRF9Gko5Hx8ZyCDhMI=;
        b=town4hvG1qF/rqFoqL0i8c2sbCHLokomE15rjS5/gwyOO2NSqUECdexp8jqeU3d5CJ
         n1m44L/35FaRYkfrKqfzKM70uUI5OGMUZ2ZKy04TpNPtXgTGBDoTN/AWMMl8dVC5CeUG
         4pzTf3had3r9aXlMG4i/bfIb2XLyRSd7FdAQZi19kJGYyShjEBB65RCVUoYzV8elnQ6+
         q4wnltIej/8D2WXB2OEZ9PCI7juttelx1Q7Z2jIlf5EyyMyAWHFi4CFHjLgLo2OI55CP
         4h4yzL+yuwAN+VqaV1dfpV702/qkhRDa31lSawicn96jZMmZ3lr/7imTn+fEM7EREXDw
         KYWA==
X-Forwarded-Encrypted: i=1; AJvYcCUuGcKbVx7S4jwJJi2DiSZeceWiMZ/kGMWEMjc5lHg3SLcTVH36XeE1q8K+uQqt/KAcHSrCh4VGTEk=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjf/HlLplER8zKhSeFu3hGO9/tDfeR5IN411XDZBTjfCvzWTZO
	ALOUJEsB027TTcavuFAYDF5xRqUt8qSwnFpnaZsdFS+58MJsb9x+qQfpQuNn4Q==
X-Gm-Gg: ASbGncvt+MDmz3m54cquioNKE64HED9HFxePXVbSjh9THtjkJUeT0k2ZjnDWyuJ2fFh
	+S/5EzhoM2iN3l//C1f090//PEJ3DzzGHFCgLh3OGkx7bROpTV1h5ObQghhv7ZlHhlSgVDxg7J7
	jykgVjy272oiPA+WpwKJm2DlHL6Gch6Tv0ym9CsRGXw6YziLuqTf8fo3x7YB/AT2cQJJK4ImKlW
	NK2BBh4QHCiKTk1lxVYDU6PutS+q7ff9d/NKsHer1VvmdCVnhEkTekMiEzlzoUrIT24bWpoNeKu
	JJddguhEC3js/6ftRAApBWIaWT4vyEcF88ma0jPVRn7WdllR2oNeW1FiVqD8Gp1BwBl/N2Nj0Ef
	9nzArhE2cI+On26+EpcRrNnOn+Sy+Bb357ueVEH8ut2MCszG2hS9/zlIP94qdkSCAy/lK1m7uHm
	v8XnBOxFK8hkwo52dn
X-Google-Smtp-Source: AGHT+IEQw0TA1CC7no4fMAMA9oQRoUt9Lgbn+Uft1azRKrTnyGz7lCiyNuO6p2GHKFOC05VVJ/iKvw==
X-Received: by 2002:a05:600c:4f89:b0:471:a98:99a6 with SMTP id 5b1f17b1804b1-475cafae164mr64272055e9.11.1761342429974;
        Fri, 24 Oct 2025 14:47:09 -0700 (PDT)
Received: from andrea ([31.189.53.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496d4b923sm89676705e9.14.2025.10.24.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 14:47:09 -0700 (PDT)
Date: Fri, 24 Oct 2025 23:47:04 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	anup@brainfault.org, atish.patra@linux.dev, pbonzini@redhat.com,
	shuah@kernel.org, ajones@ventanamicro.com, brs@rivosinc.com,
	guoren@kernel.org, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
Message-ID: <aPvz2Pb6RuWnw9Ht@andrea>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_161209_894116_97A902C2 
X-CRM114-Status: GOOD (  18.99  )
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

On Mon, Oct 20, 2025 at 12:20:46PM +0800, Xu Lu wrote:
> This patch adds support for the Zalasr ISA extension, which supplies the
> real load acquire/store release instructions.
> 
> The specification can be found here:
> https://github.com/riscv/riscv-zalasr/blob/main/chapter2.adoc
> 
> This patch seires has been tested with ltp on Qemu with Brensan's zalasr
> support patch[1].
> 
> Some false positive spacing error happens during patch checking. Thus I
> CCed maintainers of checkpatch.pl as well.
> 
> [1] https://lore.kernel.org/all/CAGPSXwJEdtqW=nx71oufZp64nK6tK=0rytVEcz4F-gfvCOXk2w@mail.gmail.com/
> 
> v4:
>  - Apply acquire/release semantics to arch_atomic operations. Thanks
>  to Andrea.

Perhaps I wasn't clear enough, sorry, but I did mean my suggestion
(specifically, the use of .aq/.rl annotations) to be conditional on
zalasr.  Same observation for xchg/cmpxchg below.  IOW, I really
expected this series to introduce _no changes_ to our lowerings when
!zalasr.  If any !zalasr-changes are needed, I'd suggest isolating
/submitting them in dedicated patches.

But other than that, this looks pretty good to me.  Perhaps something
else to consider for zalasr is our lowering of smp_cond_load_acquire()
(can't spot an actual bug now, but recall the principle "zalasr -> use
.aq/.rl annotations ..."): riscv currently uses the "generic", fence-
based implementation from include/asm-generic/barrier.h; compare that
with e.g. the implementation from arch/arm64/include/asm/barrier.h .

  Andrea


> v3:
>  - Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
>  so as to ensure FENCE.TSO ordering between operations which precede the
>  UNLOCK+LOCK sequence and operations which follow the sequence. Thanks
>  to Andrea.
>  - Support hwprobe of Zalasr.
>  - Allow Zalasr extensions for Guest/VM.
> 
> v2:
>  - Adjust the order of Zalasr and Zalrsc in dt-bindings. Thanks to
>  Conor.
> 
> Xu Lu (10):
>   riscv: Add ISA extension parsing for Zalasr
>   dt-bindings: riscv: Add Zalasr ISA extension description
>   riscv: hwprobe: Export Zalasr extension
>   riscv: Introduce Zalasr instructions
>   riscv: Apply Zalasr to smp_load_acquire/smp_store_release
>   riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg
>     operations
>   riscv: Apply acquire/release semantics to arch_atomic operations
>   riscv: Remove arch specific __atomic_acquire/release_fence
>   RISC-V: KVM: Allow Zalasr extensions for Guest/VM
>   RISC-V: KVM: selftests: Add Zalasr extensions to get-reg-list test
> 
>  Documentation/arch/riscv/hwprobe.rst          |   5 +-
>  .../devicetree/bindings/riscv/extensions.yaml |   5 +
>  arch/riscv/include/asm/atomic.h               |  70 ++++++++-
>  arch/riscv/include/asm/barrier.h              |  91 +++++++++--
>  arch/riscv/include/asm/cmpxchg.h              | 144 +++++++++---------
>  arch/riscv/include/asm/fence.h                |   4 -
>  arch/riscv/include/asm/hwcap.h                |   1 +
>  arch/riscv/include/asm/insn-def.h             |  79 ++++++++++
>  arch/riscv/include/uapi/asm/hwprobe.h         |   1 +
>  arch/riscv/include/uapi/asm/kvm.h             |   1 +
>  arch/riscv/kernel/cpufeature.c                |   1 +
>  arch/riscv/kernel/sys_hwprobe.c               |   1 +
>  arch/riscv/kvm/vcpu_onereg.c                  |   2 +
>  .../selftests/kvm/riscv/get-reg-list.c        |   4 +
>  14 files changed, 314 insertions(+), 95 deletions(-)
> 
> -- 
> 2.20.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
