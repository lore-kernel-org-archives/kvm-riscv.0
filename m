Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6CAC36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OfbIHbCp/ih5p/SdwgpBkrj9CI6u7eABkd2CymyHos=; b=FdtJU8lQE5Zj7K
	EduRj0tUq3oh6R/76SSM4M8RE55uy6Xc73rMPzbfm2mykxwtCRZeqLTnfg0f8Q1F5moYQYHBv3k2o
	llNcqITUcLh0lFo2S9+vVCgNzECo7Uy3N7AljjYZAb94oEtNxiAtre9uGY76p354V+8PHN84F2qp1
	bmow9DFDSKixfwPzFNyfpymZ07ME9x10hnEqiNWCXsWNt42V5lgR0PeD5kO0pS0Mx5LOuuv4e5Xt5
	3usbr//j4j2qEU+3DUfMMXs4UbFdnvW1wRqWK9Va1Xa6quLrinEUCsZcPra9YN6T69PgrR8PXD/6m
	LWXpoju3VZASA9CR48RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twk6L-00000003Z6q-4Bxc;
	Mon, 24 Mar 2025 15:52:34 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twk4e-00000003YWP-1tka
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 15:50:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso46163315e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 08:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742831447; x=1743436247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qXRhGeDkSWGWmmVuNBstp6OZum7jWU1CmWmtDqvRvak=;
        b=fG8FzOKx501AMpmS52PWHWFgZERm6iiQ4m4tVlYciUEeZtlASsFoJva4j1mE2kfsPA
         Y0r+4ETVzJxvApf0Jsl0AZGjZU5hiVht0SbKS44OLWiCeF0WwfrC3xaEUKfIh3xieRZ2
         k6sbDr8xcrY2OtlsEFFT+RTqgDrqakpGPrnd9EWFBJ5E1OKljdPYW/+HNJr6X67OlcPO
         z9B7nWoExiwj5KxHgUad2bEqpIhst85XHelCxT1c2+XLAl4+lmGP/t54m+ulrntqmd8a
         CLwAhnU9XkYZlPM93EPIGIpG79v05lcoDdy/iYveoGfRN6TmLd3LOwngpeBvWv3mqCZI
         bHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742831447; x=1743436247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXRhGeDkSWGWmmVuNBstp6OZum7jWU1CmWmtDqvRvak=;
        b=VLqYhY7Ep1mDnElzgt0X/0TCWuOOIMEFEWfD757Iq1ZnQGQAy8xilpkZHJG9wazS9P
         E8Yad46JnmRpNvZP8QkdGQORTlFhbSEpbP6IF0XXzBUhXumSKBTSIlemNYe7eBwpIsst
         +ILjeLvVh6utg6nDV/ewezdWpxhuHYfFLUlT0Gc1qXFtxejvRZc4R23FnrdtA+KZsQ70
         tSv54eDDcNDy0cRPvxYZJt+Qvn7A2VdSOTQW1cN64ashYaXfAS0L7717bCz6oYKfLSZM
         sCDkpvTKNhMmlp5lZbQtTTfMHGY6mqe8D8LVf9MV1RcZ3DboDLRZ0NH0IqZlL/x9zsOw
         dBTA==
X-Forwarded-Encrypted: i=1; AJvYcCXpTEyOkCNtQjdNkM83rm+yCOAc4QlEXLrKUtBR7CNRQ0PT0HexCuab6f48ljP5sMP6wnbiVG615u4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzX13M1wC4M6Atwx/HQVXa3MypFq/iVgJuRW+oNRS8Q/qjjSHvo
	ffgCHOb84r9UCvxHCgJOr6c4JWDpNCcyr1fWWRAjWxVgqa5lLPwnXaI9juVJd4d3+wSgUHmWfH9
	0RAI=
X-Gm-Gg: ASbGncs3kaC+QcQtsJXOoeN9fGvSLMqWV1droc+c2buZ9xp9WKWpCjNS3GrHXQKUhtM
	MsFJ8PpZy4AWisUvTlk/7Bnoy8dNKRRwm3LCNACgVdGZtotB5OBxQDgFZoszgIBLU+v6VekVMyq
	TsmcjSpSv8eSjuqq9NetzOmH1oy3L0XK/Y+yz1t3fAGE9fHrPB7P7DxThYlcGUorPuuKim9ucSQ
	RCjKHVd4q19u0kl8UlVGPaziHvhXZmTz50bfaX1dH0z0BOYp+zJHaWgSm02rLuH+Z50180sEBL5
	uMHKUaesUTfRXYbt/h46QtNtrJx9XBU+9bDBRxlkZzQ=
X-Google-Smtp-Source: AGHT+IEZjj1zr6KjWFTQYscKYFXgO6ZuF3B36U9IG1e4c1569+owWLaEi5bGV7PTpDSJmekOGmMX4w==
X-Received: by 2002:a05:6000:1a8d:b0:38f:2a32:abbb with SMTP id ffacd0b85a97d-3997f8f9d54mr10259058f8f.4.1742831446672;
        Mon, 24 Mar 2025 08:50:46 -0700 (PDT)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9a3f36sm11533049f8f.32.2025.03.24.08.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 08:50:46 -0700 (PDT)
Date: Mon, 24 Mar 2025 15:50:45 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 5/5] arm64: Use -cpu max as the default
 for TCG
Message-ID: <20250324155045.GB1844993@myrica>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-7-jean-philippe@linaro.org>
 <20250322-c669034d2100a75ab6e53882@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250322-c669034d2100a75ab6e53882@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_085048_540979_B1CA4E76 
X-CRM114-Status: GOOD (  17.68  )
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

On Sat, Mar 22, 2025 at 12:27:56PM +0100, Andrew Jones wrote:
> On Fri, Mar 14, 2025 at 03:49:05PM +0000, Jean-Philippe Brucker wrote:
> > In order to test all the latest features, default to "max" as the QEMU
> > CPU type on arm64.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  arm/run | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arm/run b/arm/run
> > index 561bafab..84232e28 100755
> > --- a/arm/run
> > +++ b/arm/run
> > @@ -45,7 +45,7 @@ if [ -z "$qemu_cpu" ]; then
> >  			qemu_cpu+=",aarch64=off"
> >  		fi
> >  	elif [ "$ARCH" = "arm64" ]; then
> > -		qemu_cpu="cortex-a57"
> > +		qemu_cpu="max"
> >  	else
> >  		qemu_cpu="cortex-a15"
> 
> arm should also be able to default to 'max', right?

Yes I'll change this.

I didn't earlier because it failed when I tried it, but it looks like I
had QEMU=.../qemu-system-aarch64 in my environment variables, overriding
the default qemu-system-arm (32-bit only). "qemu-system-aarch64 -cpu max"
doesn't boot 32-bit code, but "qemu-system-aarch64 -cpu cortex-a15" does.
Anyway, without explicitly setting the wrong QEMU, "-cpu max" works for
32-bit.

Thanks,
Jean

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
