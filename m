Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D079ACC6B0E
	for <kvm-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuvevJQgzr0B7PV+E/fn09nPb7vP72CfyVXGw+svLyk=; b=2N4gRPKs1e5dzi
	N0Uzb0oiBRIysMfkCUVkynikgD+63R/fjE9dzTqzjGVRpxMKqxF2FXwE/eyGPcl57kMGnyPQxH79E
	QozcHVO9iS3jTp/PFcPBEmJ3oiTyxEnmH6qIMnwj9c4Qe8PHhbvRIMkycSoomh7g/jMwVDij448zz
	R4RKHaNnC70ypai0Wkyhh3Z8ONYkZavV2aG1eiwOIKbKlhc5kXAiVQE7dfXyJ3IPsWw+sGW06xzv2
	ufrvq6wThW0Z9hrbNivSprhmtuOpyM655g+UJ7f8EDEQnGlNfATFN6SCFZPDOOpzlRKZeVxTFLrgv
	1G//jk/fd6UlqcdZmsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfoj-0000000Dbri-26c7;
	Tue, 13 Oct 2026 16:57:33 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfoh-0000000Dbqt-3ti6
	for kvm-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 16:57:33 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8ab37e44643so1235497b3.0
        for <kvm-riscv@lists.infradead.org>; Tue, 13 Oct 2026 09:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910650; x=1792515450; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xs8kx4XmYGQ3LYVznuwYx1llCxD9uoGbHIj5ZitGfaE=;
        b=X7fDdrHMPANv5Jhk9QShxp2X9+PKvjw71/eERPd4pzKiNbaDkDGzvrjdKhiZUOmdqf
         qaXZZkThKDRueBdTif7DUNcJ4XEcEN65BlyZkcFBmojdineojToB/5BT8zTIMFYPc9Y6
         l5qoG71kLB7WkQltDM6tlkml5ELstxNyiKGEch4BdIA/LlFSJf6jsQi8fj3XnEF47VDD
         DTWenDZc8mMILK4xwhUvtFBOTKGDwGL+UBxUx9QjjDO6sm0jPLU/cuNhuECWnxyMnR56
         m5s+8MoWtXEZLt2z6r7lQodpoX1uJ7+UV9c2vql01QTq7DFUGtiwotx03PAwOzQ+d5Cn
         8+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910650; x=1792515450;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xs8kx4XmYGQ3LYVznuwYx1llCxD9uoGbHIj5ZitGfaE=;
        b=AjLNRtpL7HvDxcaEQ6Gzz7O5lbKqIGaBpIzD4Y3N39aSA3DPkI1tAJHogehDJNnHRU
         sJqmGbAfeMcN4t4NFY3sZ4TvwME5zpQrj+lwYsTj7XJZekbAE1SF+sZwyoQ1FOn7a/O5
         VLk5TSzZmgm4r1SiWr5OMQ0LZpaUWylDTBnM9xVpndq56VATYty5sAdS9moo/K9xJ75J
         vI0OTbyFwqXJVjjrHOmOy9M4K13AsvN/k5j/pdyAB308IyHbdXph9jaGTjN2lAT1Jxi+
         cI8WhKw3VjAmMSXTo30EWaaaVOoW8dijYRt5llknB70f4KZzzxwzhtDb6D9Tm1hs81xH
         M31Q==
X-Forwarded-Encrypted: i=1; AKwUvBwBRzav8EkDJV5aO8zQAkoRSUygTsr7dx6KFp1qHNLy0QdSYWt6obUpRpEn8d5YxkeG1ymRKekCdug=@lists.infradead.org
X-Gm-Message-State: AFq9FYJhGV++iELKknDQxuyT3uIWV7pGf15LrRb6ToXXyAZiowpzMlsR
	vY9WuqF4PPHqAPv073agKgZLMtOQbz+bzvZsvCKbkEBDMQfHDJn+4Q3QLm/MGAtxfG0=
X-Gm-Gg: AYBFou1Tx7UMa/u6qJyZCEKIpxSMJbCdx18JavcuMPrBVHqM/Gad0vmkp/zwzK9efXi
	5GFzNGnUQrthgrzZIQfr6MBeevdHZTZM8NXslYredZyBAmnpuMSBR1HL42GT7i2udgiqjoNE33J
	mQLI9DFThnh4d7NWpdOilrPoFXf3FXrDQxPhcPn7idqxK2DwohXysLfnp8X787bXJmL86L2IRc1
	2ibN/VGFDtK9GBBbs7Gizl7IuoIsCME726OE1hmE9zRmR4ftmj12Aq6kc4C0v6pDIKNmda2oTzw
	X7b1/AjuBPkhjtzC8Olx3c6g3i5hcUwlJBCKs87ahCXdidufM9NyfCkcEzg5wke9JZ6EpYLgkd/
	RgQRqYwPNI+6hsxmynEtLCcL7+FVz3EqPmssmKgHKyj40XtGpd7mM//71mvYJKkI3+Oce5p1b0c
	kUTkfmOhqtM4oFbWl3Lx81O5B8Otdz/IyDLPqVwosSEMUigkI7mRzaSDEXCKY8USzlbj7bWkcvs
	u8/jq6Bh4vh1rfwnlSw
X-Received: by 2002:a05:690c:e3ef:b0:8b0:ad16:71f8 with SMTP id 00721157ae682-8b0ad167c9dmr17620697b3.11.1791910650173;
        Tue, 13 Oct 2026 09:57:30 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f21eccdsm47207617b3.30.2026.10.13.09.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:57:29 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:57:28 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] riscv: Deprecate vector state prctl/sysctl
Message-ID: <as5i-FZoL79anjkV@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095731_983842_39565FAF 
X-CRM114-Status: GOOD (  28.52  )
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

On Wed, Oct 07, 2026 at 01:51:17AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This appears to be unused in practice, and
> creates confusion in the extension support returned by hwprobe(), as in
> this one special case an extension reported as present by hwprobe() is
> unusable.
> 
> Since we believe it is safe to always allow vector usage, hide the prctl
> and sysctl behind a Kconfig option and mark them as deprecated, so they
> can be removed in the future. Note that significant userspace software
> like glibc already considers these controls explicitly unsupported.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> 
>  arch/riscv/Kconfig                 | 10 ++++++++++
>  arch/riscv/include/asm/processor.h |  4 +++-
>  arch/riscv/include/asm/vector.h    | 16 ++++++++++++----
>  arch/riscv/kernel/vector.c         | 10 ++++++++++
>  4 files changed, 35 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e26450f0d38fb..83e52a0a85ba7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -650,6 +650,16 @@ config RISCV_ISA_V
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_V_VSTATE_CTRL
> +	bool "Deprecated prctl/sysctl for disallowing userspace vector access"
> +	depends on RISCV_ISA_V
> +	help
> +	  Add prctl and sysctl interfaces to disallow userspace to execute
> +	  vector instructions. These controls are deprecated because they create
> +	  ambiguity in the ISA extension availability reported by hwprobe.
> +
> +	  If you don't know what to do here, say N.
> +
>  config RISCV_ISA_V_UCOPY_THRESHOLD
>  	int "Threshold size for vectorized user copies"
>  	depends on RISCV_ISA_V
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 815715c67f940..ad64df01417a2 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -121,7 +121,9 @@ struct thread_struct {
>  	unsigned long envcfg;
>  	unsigned long sum;
>  	u32 riscv_v_flags;
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  	u32 vstate_ctrl;
> +#endif
>  	struct __riscv_v_ext_state vstate;
>  	unsigned long align_ctl;
>  	struct __riscv_v_ext_state kernel_vstate;
> @@ -202,7 +204,7 @@ extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src
>  
>  extern unsigned long signal_minsigstksz __ro_after_init;
>  
> -#ifdef CONFIG_RISCV_ISA_V
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  /* Userspace interface for PR_RISCV_V_{SET,GET}_VS prctl()s: */
>  #define RISCV_V_SET_CONTROL(arg)	riscv_v_vstate_ctrl_set_current(arg)
>  #define RISCV_V_GET_CONTROL()		riscv_v_vstate_ctrl_get_current()

nit: consider changing the enclosing CONFIG_RISCV_ISA_V at the comment to
CONFIG_RISCV_ISA_V_VSTATE_CTRL if this needs respin.

> diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
> index fffe72a772080..5425a25f8a196 100644
> --- a/arch/riscv/include/asm/vector.h
> +++ b/arch/riscv/include/asm/vector.h
> @@ -404,9 +404,6 @@ static inline void __switch_to_vector(struct task_struct *prev,
>  	}
>  }
>  
> -void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> -bool riscv_v_vstate_ctrl_user_allowed(void);
> -
>  #else /* ! CONFIG_RISCV_ISA_V  */
>  
>  struct pt_regs;
> @@ -418,7 +415,6 @@ static __always_inline bool has_xtheadvector_no_alternatives(void) { return fals
>  static __always_inline bool has_xtheadvector(void) { return false; }
>  static inline bool riscv_v_first_use_handler(struct pt_regs *regs) { return false; }
>  static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
> -static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  #define riscv_v_vsize (0)
>  #define riscv_v_vstate_discard(regs)		do {} while (0)
>  #define riscv_v_vstate_save(vstate, regs)	do {} while (0)
> @@ -435,6 +431,18 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
>  
>  #endif /* CONFIG_RISCV_ISA_V */
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
> +void riscv_v_vstate_ctrl_init(struct task_struct *tsk);
> +bool riscv_v_vstate_ctrl_user_allowed(void);
> +
> +#else
> +
> +static inline void riscv_v_vstate_ctrl_init(struct task_struct *tsk) {}
> +static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return true; }
> +
> +#endif /* CONFIG_RISCV_ISA_V_VSTATE_CTRL */
> +
>  /*
>   * Return the implementation's vlen value.
>   *
> diff --git a/arch/riscv/kernel/vector.c b/arch/riscv/kernel/vector.c
> index 9641343732782..b35d11ff3cc89 100644
> --- a/arch/riscv/kernel/vector.c
> +++ b/arch/riscv/kernel/vector.c
> @@ -20,7 +20,9 @@
>  #include <asm/ptrace.h>
>  #include <asm/bug.h>
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
>  static bool riscv_v_implicit_uacc = true;
> +#endif
>  static struct kmem_cache *riscv_v_user_cachep;
>  #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
>  static struct kmem_cache *riscv_v_kernel_cachep;
> @@ -144,6 +146,8 @@ void riscv_v_thread_free(struct task_struct *tsk)
>  #endif
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
>  #define VSTATE_CTRL_GET_CUR(x) ((x) & PR_RISCV_V_VSTATE_CTRL_CUR_MASK)
>  #define VSTATE_CTRL_GET_NEXT(x) (((x) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK) >> 2)
>  #define VSTATE_CTRL_MAKE_NEXT(x) (((x) << 2) & PR_RISCV_V_VSTATE_CTRL_NEXT_MASK)
> @@ -182,6 +186,8 @@ bool riscv_v_vstate_ctrl_user_allowed(void)
>  }
>  EXPORT_SYMBOL_GPL(riscv_v_vstate_ctrl_user_allowed);
>  
> +#endif
> +
>  bool riscv_v_first_use_handler(struct pt_regs *regs)
>  {
>  	u32 __user *epc = (u32 __user *)regs->epc;
> @@ -227,6 +233,8 @@ bool riscv_v_first_use_handler(struct pt_regs *regs)
>  	return true;
>  }
>  
> +#ifdef CONFIG_RISCV_ISA_V_VSTATE_CTRL
> +
>  void riscv_v_vstate_ctrl_init(struct task_struct *tsk)
>  {
>  	bool inherit;
> @@ -330,3 +338,5 @@ static int __init riscv_v_init(void)
>  	return riscv_v_sysctl_init();
>  }
>  core_initcall(riscv_v_init);
> +
> +#endif
> -- 
> 2.52.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
