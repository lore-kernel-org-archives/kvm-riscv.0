Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B293ECCD1A5
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 23:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FgL/gFAbdw39K1h+zWJC8MVhBKyMjNnonYaAU0T+Wa4=; b=KidRzH70u0RwBr
	oGLMMRtMuH2Zy830Br5Hla5kFnzYIEDNMkN8wd+Zx4y8k13TShbwNBxBQbpXbLzQByabBPK9Zuab4
	nO6+U5EgrqDFD+KR5gYCL4nirpFaFihmCx54t+oF1YpaisPTygSaEv1CwjmaBjqqXNTEERLcrSCx8
	UEfKuCVUCxX/RrMnvIRIx4+0AFyNjseGWebycAugoNhQ/W/Cq4R8uimZ+2H2rapmWkGZ813k8VPyr
	1P+rpcABFwcITeuvyPjH/8gjpudD1lSIXEZ9OvTIbfj2AECpZmVwDDq6bZBxxNOwiZd2TSczYf6wK
	kBK7rgD17NlWLuIvoGDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLt1-00000000w7h-1GkO;
	Tue, 21 Oct 2025 23:35:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBLsy-00000000w6P-3vei
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 23:35:26 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b5515eaefceso5059339a12.2
        for <kvm-riscv@lists.infradead.org>; Tue, 21 Oct 2025 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761089724; x=1761694524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KMqedveoxF1jqXrQrkQUG0gxCTLGrv1ZuDWLX2NkabI=;
        b=E6y9WOyHaHwy7Ig64OxuKWUIPWJ20ggLkxuVPfoc+4rSQZLlkHelEbhNHg6WhYDGC+
         g93STWJppvAmPSEG05dBC7tI6Glo9pR4X5ak23UfUG4xw5LlofTbgVbkiS+oNH5BdJ4w
         hpumfQofHpj/r+q6XU5p+pHT6feCoxVoP7nBMYbAkqaFmMRikN9Y43xhQWhjE/k+kqNj
         KwF5I7mFkI8JvHyaI1uzeKkCS1SunHRzLOMyZo2LM1oyEN0l0XvsMkzlqaIEkO1onb/m
         Y54Yf1vkkwGZ84inMAKm6mdW9RuPMrmSKhFdQDtXD+0QF6nItJsK/CQDel61oe5TQ93C
         DvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761089724; x=1761694524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMqedveoxF1jqXrQrkQUG0gxCTLGrv1ZuDWLX2NkabI=;
        b=xT7gYtR/pSl1L55EoQ3bpQCtm4CApgTWfbPFvzfqc4nxo2fXylxpJJbHmFA4SGdX6v
         Q2ir+gJ1+GdqML2pxPethsuVfLv+bXe8xHPaF0gHHumBZ5Fxkcmkt49x1nsDEQSDX/2k
         jNUZwxS7V3sjKhoowMObw4EhyW/7Dh2UNFUirjFkxh/doLhohrtjBW3r+PbRQutjH43K
         wR1mRn1b2706CfoJZa+gcloSWZfu3UCULdfx1JWRgQlK1kszW1AQoQo8d5blBmUDo20e
         WFtafhT90C0VVREcUkCVTzovSBlJ5xgughpg+4KABW4XSNuKCsp1WVhwkFHBI56aST+v
         lyCA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ZouRr2+qJ5YRtAidhQ3zMIDe/zBY678qrS5azeGfd2HxJvh/wcXtZft8KisjSwibd/tqcW8QwV0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7lomUIhE3Pe1cut0OupnD6eZVXAtVCcr8bLp+Y/xLQ7GYdpQg
	Qq4W1erDaH68c034IXEdI4BDGveJgQF+HQ6QAgPJPnSW1HzA+HoGt6ymMcfzfIj1wJc=
X-Gm-Gg: ASbGnct0QF8k/NmSjQHDx+G/fWLhNYfhRboh4Ss+037YmXuNyc1asy7gsVGTDag+zEp
	J1tZdg2y//vPKF0B9vQ/oUJILnsIxnrehB6y/3seTn8JK8OtlQL5ehil2aAVegGXGKYWT9Kooip
	egpvjSc0V9GwohH05oMx58lWQtFVnPbK/f+bfqzWcPc6uF8N9D9CoMkQ4FmLUNGNAvPvOFFcfJv
	tQu12x7Opuiiru1NN3E87YgauIOA229GcSOVU7YhbfPffy5qBGJr5cPsxoiCaXCuH3XN3N8p0Tx
	KYyhSs2Si/RPZRk/NCUH9gHR2ciDX7PhG938vDqYyshbfEvh3rBlYpvW84daCIO9sW1klpVokLi
	cmczsxnYFjrEhlfXQuDBbqU4cTgpl79fp8jKnr8g+PGrSwzy7CggEYOmhysduOKQ1HfnOa5EK5j
	Fdyg==
X-Google-Smtp-Source: AGHT+IHW9gnXEajt2ghxJTMfyUYr4iERSGjpWgWxgSLvvBOJMH0WsPOZGe0uhbB1w3eYOh2f0ABOyA==
X-Received: by 2002:a17:903:19cf:b0:27b:472e:3a22 with SMTP id d9443c01a7336-290cc6da03emr237742595ad.56.1761089724121;
        Tue, 21 Oct 2025 16:35:24 -0700 (PDT)
Received: from localhost ([208.115.86.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471da2f9sm120832315ad.62.2025.10.21.16.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 16:35:23 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:35:21 -0700
From: Andrew Jones <ajones@ventanamicro.com>
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] KVM: riscv: selftests: Add riscv vm satp modes
Message-ID: <20251021-27169a2033bbb30d1e792862@orel>
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170334.59H3Y7fB074149@mse-fl2.zte.com.cn>
 <20251017-a54df6d42b219d16a24a26ea@orel>
 <7b0a5403-2438-4f19-808b-1c9a64730be7@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7b0a5403-2438-4f19-808b-1c9a64730be7@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_163524_978257_2A0F6C91 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, Oct 20, 2025 at 09:09:52PM +0800, Wu Fei wrote:
> On 10/17/25 23:38, Andrew Jones wrote:
> > On Fri, Oct 17, 2025 at 11:13:33AM +0800, wu.fei9@sanechips.com.cn wrote:
> > > Current vm modes cannot represent riscv guest modes precisely, here add
> > > P41V39, P50V48 and P56V57.
> > > 
> > > Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
> > > ---
> > >   .../testing/selftests/kvm/include/kvm_util.h  |  7 ++++++-
> > >   tools/testing/selftests/kvm/lib/guest_modes.c |  7 +++----
> > >   tools/testing/selftests/kvm/lib/kvm_util.c    | 15 +++++++++++++
> > >   .../selftests/kvm/lib/riscv/processor.c       | 21 +++++++++++++++----
> > >   4 files changed, 41 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> > > index bee65ca08721..02224bc514d4 100644
> > > --- a/tools/testing/selftests/kvm/include/kvm_util.h
> > > +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> > > @@ -179,6 +179,11 @@ enum vm_guest_mode {
> > >          VM_MODE_P36V48_64K,
> > >          VM_MODE_P47V47_16K,
> > >          VM_MODE_P36V47_16K,
> > > +
> > > +       VM_MODE_P56V57_4K,      /* For riscv64 */
> > 
> > This should be P59
> 
> Although sv57x4 in hgatp does support P59, sv57 itself doesn't, so guest can
> only address 56bits gpa.

Oh, right.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
