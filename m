Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C44CCD1A4
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsTwe5zFn9lbyiKD0IZ4sxnaK6SqaAgyP6qbuiNmQGA=; b=Ra9p8CP9KDcurJ
	225w7zV5nsrTAHZktu061fdwSkfjJWLPt9NoFNv0jYjXqhKzZa7SS6hZf1JizoQI7ouabXvXAbnJF
	KUntAIlqFwVoQ3CIsp5vnJ/LeKfLW1YuEWNSExfOfdGSm63d5pCVOMTgn5Ud9w4OzNAavWLC4ucgQ
	tzy6+kZUEExiksiRxX/pdqC8trrh7V+zY+Fxlj54W4QUBQgz9VUBMIl23v5C0NTfPk9VyLFX/Xx+C
	OGp6pcoy4by5uJZ4Qxm0OFz4Tq19wxMaubpLnxIAZE/lzna1D5/c2wQVIvT1tflruTLKnvrqv3KTE
	0BZTMoi9bLgfwQhp0C7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCM-00000008Q4C-0Mub;
	Fri, 17 Oct 2025 16:20:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCL-00000008Q30-1GO7
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uHcp/aWTKuBzfOH84Xc834di52qmuKsQVMyFNNeyUD0=; b=A8ni0X01z2cnVKewPoa3KDw2dk
	PdbAGoHMzAbDiVyIaPTwhfz6ovjKEBBpY/69MnN78KtXi2dc/sCu8FXxSimHqzr0S6tCen0NS7ljq
	6+Z1Fyc6IjejWiY3iuvgWYRBQ8XUaMncPdwFR3UfcF6kEdKGWk6QADThMh/p3WE3MCMLpVdHhMWfd
	zfJy4FeGno1KZQGI5vFVCPi45E1xTqLm9II2plLH55PIw07hG0zbJNWVzPfm/WhhPPj8sDtL5c90o
	eaC7sTzrB1EFHmbLyaYBnrP81bbMldm3HMhPBol4LB9Izf9ZOZ1YhkNN1KS0D6UgAOTU49Iv2/At6
	NXBXP0RQ==;
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9nCC-00000007kAo-1bMo
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:20:53 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-93bccd4901aso176488839f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760718045; x=1761322845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uHcp/aWTKuBzfOH84Xc834di52qmuKsQVMyFNNeyUD0=;
        b=EoIqaHJG7m236vlk5PH4op+h+ZHfwTBEWUttMj7d52LdEytdhkEL2n4JhVWLVrQZHT
         9CKn272aG2MHthF9k7f+cXE2z069mQ1Lbeg5LEy30eiWbvSPzx94iEEArenJBhU57PU2
         skoe/fncztIQKkAOqsIsK+SxdFTaZHESmM1nycWjmB6s3xqikhAuxRLTDIPVe0nCoICe
         1Bdgk2Kd6W4kSqM3f8nDp7Gk4mkWgGFTuvwkMxKyecEoAXR88ChqVA0H5N8hvbThaWm5
         nNSCAN3++62vD+2XedlersU9sIyT/gReKYZI0CzMxvCcoCH5gYuN//wfEdDYFKBwmxNR
         jsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760718045; x=1761322845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHcp/aWTKuBzfOH84Xc834di52qmuKsQVMyFNNeyUD0=;
        b=n8IhkyPjF1+5h9iVz+vVenquI9LfAe7YMPXgLk8n0N4sh68EeGCtMSImvUdnSknDcM
         oHmKE3PYPtLtfFALNJ98Dqcw6AaEI5p+sTsMD3+XHc5+BW34iA0IH4Kvaa9ajEm9x+bU
         9T/pKcJaQM7K3tbw6/ckLU0GFlgo8hoeNI/zjMH3A0C1gE7ja1G+cjGNRNadjemBgajK
         XQTAs37mIyAPDvhaJDfZExGtjezfVT7s7DvGgdBHgTvQ4iM8GY7MidpXBelaT9nNgo75
         za/86bGj0rpP2UzCXq4RcmImbJLbZ4sM6R/ZRMtL3HBXVL3JQaS5Ga6iQo9U1gRHb9lu
         dTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Waoqd8nY6V9aSJHNIS4GVw4M0N5J+QW0L0mTsZgegZt4tWHhf9W0p0YZnUBSnSR88XjrJ5mZx5g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEOi1DCjKtgQr20evQ0r1WNpIVi6mn07OUJk7fx5XSQUUFSwau
	vkaLBpKHiESiNFTQTKuVkLCENGlb4cMjSZZ/LYQ06WY1gh1t8mPHDncU+deaolkibdE=
X-Gm-Gg: ASbGncuLW/oNDpC8xpqr7JUX1tN1ybh0nP9r7Ym+FCo5Avm/iBuX+cyFXPL3ZAccBwU
	viNvTTOVsdyOO2U+4JxTFIrqHIFc3TBbEXs0zlIYYbGKgDBnV/7Hivh23k7HRz0WHvA9f+5tYW4
	z37L6LGHUoWb0AJy+YOUC1EoDskfHNojm9uX9uhYh1ZelaoaJszFTGWUl0R9zF3f8fGo5UHmtlG
	iGkzD08uGoaW9EKVgSKo1K7S3sxpoxLfn6s1FA6HvwUmvF9jPY0Wj9OToSm+YwhGTa6G658WQ2U
	tmP4jU1PAHmtIRHM3Q3PATomD8agBud0UxuubOAKDtPBHAmAq2Honb5izP5/5Ha9vG9eZZ0jEpA
	ad0WiL8cq3b6Z2nfIzSiCCCjkWAtrl9O5K0yErAqmmmPt9F8FvNufQhMtvU8rMWqcCgxiPUhkbD
	a3fw==
X-Google-Smtp-Source: AGHT+IGb7WVIYEXYDolygsCFth05K0mPGRPpQvAMXm74hPFwBGeILraMt8hiRJ5jXXj3KN04uw/DDg==
X-Received: by 2002:a05:6e02:1905:b0:42f:9e54:76d0 with SMTP id e9e14a558f8ab-430c52ac0d8mr55233645ab.23.1760718044856;
        Fri, 17 Oct 2025 09:20:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-430d07a874csm804025ab.19.2025.10.17.09.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 09:20:44 -0700 (PDT)
Date: Fri, 17 Oct 2025 11:20:43 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Add SBI MPXY extension to
 get-reg-list
Message-ID: <20251017-7e149a197ad3d9d99bd45a4b@orel>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
 <20251017155925.361560-5-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017155925.361560-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_172050_637620_533C1420 
X-CRM114-Status: GOOD (  14.07  )
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

On Fri, Oct 17, 2025 at 09:29:25PM +0530, Anup Patel wrote:
> The KVM RISC-V allows SBI MPXY extensions for Guest/VM so add
> it to the get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 705ab3d7778b..cb54a56990a0 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -133,6 +133,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_SUSP:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_STA:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_FWFT:
> +	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_MPXY:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_EXPERIMENTAL:
>  	case KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_VENDOR:
>  		return true;
> @@ -639,6 +640,7 @@ static const char *sbi_ext_single_id_to_str(__u64 reg_off)
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_SUSP),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_STA),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_FWFT),
> +		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_MPXY),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_EXPERIMENTAL),
>  		KVM_SBI_EXT_ARR(KVM_RISCV_SBI_EXT_VENDOR),
>  	};
> @@ -1142,6 +1144,7 @@ KVM_SBI_EXT_SUBLIST_CONFIG(sta, STA);
>  KVM_SBI_EXT_SIMPLE_CONFIG(pmu, PMU);
>  KVM_SBI_EXT_SIMPLE_CONFIG(dbcn, DBCN);
>  KVM_SBI_EXT_SIMPLE_CONFIG(susp, SUSP);
> +KVM_SBI_EXT_SIMPLE_CONFIG(mpxy, MPXY);
>  KVM_SBI_EXT_SUBLIST_CONFIG(fwft, FWFT);
>  
>  KVM_ISA_EXT_SUBLIST_CONFIG(aia, AIA);
> @@ -1222,6 +1225,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_sbi_pmu,
>  	&config_sbi_dbcn,
>  	&config_sbi_susp,
> +	&config_sbi_mpxy,
>  	&config_sbi_fwft,
>  	&config_aia,
>  	&config_fp_f,
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
