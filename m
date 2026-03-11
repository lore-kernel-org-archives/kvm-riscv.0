Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B090103E2F2
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 23:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IZkfKhe0ZkjxNzBStFSxL7atRkhghP06wqbZb0Z9zA=; b=J6tsZjZrlAUffQ
	eW98ZQj7Z/qWEz5Y39akKqAeI6ZoDII9ECAB3krqQimQA5ZE1y8dMZiBgsPIGyUxCWnNuTq7R6iPs
	aCbT7yvDUirF5QuL7YhL7pgXnFsk5MyOddNjrXRJWRLvEBBIXDn94e1atRVk4RIV82rVBoc3pXlki
	/g9GCiEbP6rGtlWNlOt4Y809ewvXm/VfiHO9foY6tYXyhYS2i0oRhu4Dbqevz0icxFLct3HXnjQhg
	wTz43zfUpCVO3+MqDEWI8kTfCjM+zsVuSkeNwHN8m894f+XNCF8m0g3LyLcqy2uqcZCcmXf8zYI+L
	eSVYjiTUlNsCQYSArEyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0SoB-0000000CnDz-3k7O;
	Wed, 11 Mar 2026 23:17:43 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0So7-0000000CnBb-2OII
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 23:17:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439b6d9c981so295635f8f.1
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773271057; x=1773875857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0YAX8de4YmYeIq/8WNtylATFHnJksgOAf2WopH1Q00E=;
        b=UM4ruXQtBRut7H9WNrY8W1WSzwDCRfePqepy7PMgU99t3GQhtKlTvwpWSJvmA4gNn2
         lzn/LfoAN62w/mbaBu3jfj2iNmlt2IcNnKaYDSCDzy6UoMz5N6kZk6iAgBIDJFiUwfe5
         Xi8W0yedS3d9UvdI7jUy/4hlsAuRchHg4PT47Itn9l6Zj4GfIXLngafzkxPV/OtUjnmN
         3KtitWqusSECdWNLlMCZb+hag2UOQjVnTtVGZ/ZwsVuCd01fG+FhvR3BBI5TxOAFN86f
         yUrmwXZRWI9xcgzK7ZonW1QtsIYRgQUy+7ex1NOJwE0z6Me5yMmPtG1EdsC25y7ydNQV
         BUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773271057; x=1773875857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YAX8de4YmYeIq/8WNtylATFHnJksgOAf2WopH1Q00E=;
        b=Z1lqZbhjhGZh4k9sYClRPPJ39eiRxPAX0BW49XjPfIlEgxbxHIb04uuT5kpPnwTKan
         IPJRuxIJyRjD/aBUxRsu0ARIXuT+rxGL4Yza5mQ33sk0bBr3ipF9j59WOMrh6+A9hzE2
         60oeoTaRH631aSTC9verD3S8CF1J0oaITuLrVNagazvOXBi1qzxvqU9bQASP7AC9SnfO
         sewRi7RWGU7k0k/ba5cZYbnlC7vGWllBv4FnBuzUDQqHTs6yFceeQ+Jmfd1B+iqTIcfC
         /ur1QRIupoSXtWwC9ReTreCjoRgkKEGDl1uMZ92w3EMf40foNMjbRCJPgZyGtRbPSA9Z
         b6oQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0JRwL964qSTqon1UYrAgKt4xZttwcgdvIaXj1zOhR0Dya2avhDDEoMHRQZ2B9GKGE+oaoVncT9MA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcqfSx4kfPRW0RJtpxqRpmFFQr1vo1eN29LRT8fzsDQ3/9yP8G
	vgNfyaFtUN7KarncH2J4gPXHd65rpYTQGB/TOYR/jexlViB7HrJGW5dI
X-Gm-Gg: ATEYQzzB9JFe35Qi5AC+9/AhaTbsIpqmT2GLsxJBMqOLipCBEfPKz9xWtVw7FCR6uqO
	JYb2p8wHo/XhroM/G3J6eqWcwonoBiUb7xbLui1v8jsgIQwuNh0aVASJqjudzzH3SWfRdeAw7+D
	VREBsVpthZIQBL4nz6LVzAFMOf/ECmll5qp6kVfq4jcUasEpoT2OuNn2WSKLKm2HemYQfnzz+mD
	O8rQZHzd01faOMZIt4YJdgwdsMbB3h5LtwntAoCj0m2SXS8hgomJ7zMywcG7gEuhpCiD2z+B7l4
	bDK2i2ZZUM+NmYva+g2TT2EWCyyPgao1UuDRgoFgCM9yfJGl7xv65Ac2QlOl5J3N3kbmIAvviq/
	4O61otrWivdrh/9zFK8ggI6UNERLPvOLC5yDcEIlj/MTGeRcvE2ugS2gQ1yH+6lIM75nSDed/2f
	oDSqMHTZZY7o3tJT1IHkuuBOs3GoA7HEmY/laZvlu8MeUPLEFxFtBrpc5EOg==
X-Received: by 2002:a05:6000:1a8e:b0:439:bde0:62ea with SMTP id ffacd0b85a97d-439fe1ae91fmr2554188f8f.29.1773271056823;
        Wed, 11 Mar 2026 16:17:36 -0700 (PDT)
Received: from osama ([156.223.222.252])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm2773963f8f.29.2026.03.11.16.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 16:17:36 -0700 (PDT)
Date: Thu, 12 Mar 2026 00:17:31 +0100
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
Message-ID: <abH4C8RaycAqxySF@osama>
References: <20260307234355.69831-1-osama.abdelkader@gmail.com>
 <guxeojlqqz6cfjdilxnuaeyft4cn4lwdrbplat7xgd5w5hod44@uxqymidomd55>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <guxeojlqqz6cfjdilxnuaeyft4cn4lwdrbplat7xgd5w5hod44@uxqymidomd55>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_161739_618524_D600F454 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Mar 09, 2026 at 04:12:43PM -0500, Andrew Jones wrote:
> On Sun, Mar 08, 2026 at 12:43:54AM +0100, Osama Abdelkader wrote:
> > When saddr_high != 0 on RV32, the goto out was unconditional, causing
> > valid 64-bit addresses to be rejected. Only goto out when the address
> > is invalid (64-bit host with saddr_high != 0).
> > 
> > Fixes: c2f41ddbcdd7 ("RISC-V: KVM: Implement SBI PMU Snapshot feature")
> > Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> > ---
> >  arch/riscv/kvm/vcpu_pmu.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index 4d8d5e9aa53d..045099ca904b 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
> > @@ -425,9 +425,10 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
> >  	if (saddr_high != 0) {
> >  		if (IS_ENABLED(CONFIG_32BIT))
> >  			saddr |= ((gpa_t)saddr_high << 32);
> > -		else
> > +		else {
> >  			sbiret = SBI_ERR_INVALID_ADDRESS;
> > -		goto out;
> > +			goto out;
> > +		}
> 
> nit: Could add the {} to the if-arm too in order to keep things balanced.
> Otherwise,
> 
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> Thanks,
> drew
>

Hi Andrew,
I'm going to do that in v2, thanks.
Thanks,
Osama 

> >  	}
> >  
> >  	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
> > -- 
> > 2.43.0
> > 
> > 
> > -- 
> > kvm-riscv mailing list
> > kvm-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
