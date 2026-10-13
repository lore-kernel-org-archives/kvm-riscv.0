Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A847CC6B0E
	for <kvm-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 16:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PFrDod5scdcO/vRIQwYEiUBMaqX4mXGfyXY/z7zU5bM=; b=D0Hw8Tqq7j0WFt
	mZEF3KkeDQcRTiktkH3GDkKpVkbRaGweQKjNPUIpLkuqHo5QvSBKXgbKSoHi9yMHz+v/8uWDi9Xan
	QIutg3PDfMI13Rj0WoWIcmxhVIsw6X0Sfy+cHjzU9o7phtKCgeaAHreu7v/03B+mknqSLUfWgfgcy
	x//CJSZ2WNaqC68SQZBvlGn4l5zJ4CLQv7/K1unGL1lv4PbyxFk5hdYkMWXlNEMgyX/1NWWhxUT6/
	m0Y7jiqYM3trsO0Lsk0Kqe2d3iqAKAZnGmImZfNwapJVIFkeUZYHI22TmskajpqDhwIuyZE+yoKt1
	t6MBctZc6Tc889z5uAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfpQ-0000000Dc1N-3uNV;
	Tue, 13 Oct 2026 16:58:16 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfpP-0000000Dc0S-0jF9
	for kvm-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 16:58:16 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8565d77c277so22228217b3.0
        for <kvm-riscv@lists.infradead.org>; Tue, 13 Oct 2026 09:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1791910694; x=1792515494; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=laIYJl8lTaP86mKuKV52j9MpiQPLusAyIN1HdFdU1iY=;
        b=CGq85Tv7lsqV0kB6rowTaQb0QDg/3C58+Xf6GPQ8oqbDHDruHYiWSOP+ucCNweJouU
         7nx4FJLFRhEt6VQTSMnHUyeWAPTfRZvYYeeRaY0FfW1BIurxhDyiUTTUr2WP8sjfX2Ie
         KoT46sjsOk4M8JfOGQFCfYkZcj4lJiu2PgjZQMRReZHgfUoukTw7aQ4YsNOLGm9mYKnH
         4HucxuP5ezlONvR7TwR5BlwXrhH4dUCO7OmkrI/5vTk5WlRLuVPDOm2/Y6FHEDQ0kYb9
         mn2Byf8u/mOMlpI9f5D3ar9iINW4/SpOJU85dujPtD2gBaZgvPizCsBRpPbjbePBg3GM
         lT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791910694; x=1792515494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=laIYJl8lTaP86mKuKV52j9MpiQPLusAyIN1HdFdU1iY=;
        b=iwfWCwjN2HSp+uxsIZ9gRu3DxmuRjBPAsEU/KixFlKILUSRdmEYCXr27Nrt6lcLL4X
         4sB8uHc1u+Wvgn7Lnr/ApR5wRwr7W8jy+gmY9UJpLwCkT8aMtf8Sp/2X3iiRDlCUcVQO
         8hIg6N/f87bnl+QMeLJFiGKnwEv10amyaucVRVZb8X2l1jdyW0KKjfEetYlSQlsDP57c
         vu4Q5ZrRNdJXlhiIRs1jsn+iY0mKYgaCm51Idy0ueID5ROPYUrqtBzCj1FanF2vVZZ4t
         rvRtHeJb6Q6aA6TIyr5i+osAgkUNoXb19jxksQKuS0cBsC9eHx2IMQ4ScZIfci3Ta0VT
         2pgA==
X-Forwarded-Encrypted: i=1; AKwUvBw9pOwn4h5Wb430iApHJUw9BC4i+7LmQfeNK7AUFjchraoVWwQj0B4cxm17vEcjS56JWlXzTTHW8h4=@lists.infradead.org
X-Gm-Message-State: AFq9FYLAjkkjCcnWXb/CB0zYkNIz1e10h/HMBiPl4Z6UdAjwzyNYv/Q9
	0hnjIPxo/oeDaXR4Gp/cW/NuTo8Wbg1uxoFFTn0l81GAdaJ479iPf9QEOTeN+0NJJIU=
X-Gm-Gg: AYBFou3Sjpi4nmoNbzdMdrrAbyJ1ZLxg/alV24pkacpTkOS0JhPvcU/LiQKIojRlb7O
	ztLpfXDabrQs8On07El+WxZINhsykJQsqLQEAO/SWHLzefJ+zwruOIGdgMvGUWtRKLUN/NCxVFv
	YsYXRnFDadb7U1KsfoS5S6vcNnUL93bCBFoEuotHmuaxW8gY0gyFqA0XXVWAgtWadDm6XftIDbM
	HjIMIt/lJcez+mWJ1xMoW7MlRc6gl8cQ1b54RKCdqSJ5Jw37grw3fr4WjHbKM7J7jIAsYsv+ZYD
	AuQPvZ5IvSq5/d2/g2Gld2A5VZXiZhMQGNmLFOLAZzXAnRn7Hmo33a9BaKRQXXobmZvwjEI8o7h
	/BxqZVBSuRNeAk3qCKr6p8O6mwEbJsm7525ViMyezF5LZztMWa90vhgYupiSI7ggptukr8e1Rxw
	m6GIhRKMNgAAfHrR8hmw+qXqXBFv9gLWV68f8VPjxUY3I4Anliff5zuaDHUgl+otgqQPPAc2ghY
	tHvLrjoqZUcSDl+n0xciXkCyO3OLso=
X-Received: by 2002:a05:690c:a707:b0:8a8:8d90:a6c8 with SMTP id 00721157ae682-8b07ebf63demr28292507b3.6.1791910693578;
        Tue, 13 Oct 2026 09:58:13 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:d01e:ebe9:3ad:261f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0c1d50766sm2626537b3.49.2026.10.13.09.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 09:58:13 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:58:12 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Paul Walmsley <pjw@kernel.org>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 3/3] RISC-V: KVM: Decouple vector prctl state from VM ISA
Message-ID: <as5jJCqsRf6kNOAS@Tao-Chiu's-Mac>
References: <20261007085126.222688-1-samuel.holland@sifive.com>
 <20261007085126.222688-4-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007085126.222688-4-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_095815_217163_07DB54B2 
X-CRM114-Status: GOOD (  17.17  )
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

On Wed, Oct 07, 2026 at 01:51:18AM -0700, Samuel Holland wrote:
> The ability to prevent userspace from executing vector instructions was
> provided as a escape hatch for software that was broken by adding vector
> state to the signal context. This was hooked up to KVM so a process that
> could not use V in userspace also could not create a KVM VM with V in
> the ISA.
> 
> Remove this connection as it does not really help with any compatibility
> concerns. A VMM that does not understand V will not include it in the
> virtual machine's ISA.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
> 
>  arch/riscv/kvm/isa.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
> index 971f44655100a..447c778bf850e 100644
> --- a/arch/riscv/kvm/isa.c
> +++ b/arch/riscv/kvm/isa.c
> @@ -9,7 +9,6 @@
>  #include <linux/nospec.h>
>  #include <linux/pgtable.h>
>  #include <asm/kvm_isa.h>
> -#include <asm/vector.h>
>  
>  #define KVM_ISA_EXT_ARR(ext)		\
>  [KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
> @@ -159,8 +158,6 @@ bool kvm_riscv_isa_enable_allowed(unsigned long ext)
>  		 * Guest OS can use Svadu only when host OS enable Svadu.
>  		 */
>  		return arch_has_hw_pte_young();
> -	case KVM_RISCV_ISA_EXT_V:
> -		return riscv_v_vstate_ctrl_user_allowed();
>  	default:
>  		break;
>  	}
> -- 
> 2.52.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
