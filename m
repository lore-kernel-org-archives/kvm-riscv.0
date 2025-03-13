Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D46C282DE
	for <kvm-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWULu0v/UhgjLxpr5d1XkYsBnYtPw6+TNy+1Th4MJFQ=; b=KHZg5e96ZRqyyS
	aSZvXgqMQ2MpzcbJwRl33ACBIshpRzTARHimcb4bHK3JO2XgiKBkoyrTXLbLV7qyZRKU7p6cyS7Gr
	DAcyiwAlFHNspaP+l4XwY0cnVsY8HfOqxFOgTt6zu6HTW7PAmDC93oT53luce4/0De5WQn8ByOp6v
	0A6yUYFMHiKltbNQ7q3bRv7YP9gSZasDmXKPqoTYbzZJsfGDhyjvLtVX00Nil3HTbZsnignZYsl4V
	MHaw8Z7XHULlLpZaWm+/dmV3DIghTS/csgxGmRGrvyIujw3m0gzFL6otGB+N0yLS2NoMrxioFKdJL
	lfzxpgQCkcBgDHCFUlhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshfb-0000000BEwI-1lZp;
	Thu, 13 Mar 2025 12:28:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshcE-0000000BEM4-17Kg
	for kvm-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 12:24:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-391211ea598so542269f8f.1
        for <kvm-riscv@lists.infradead.org>; Thu, 13 Mar 2025 05:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741868684; x=1742473484; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jdwK1Zh8ZZo6rwDf542VaxRAlTlQ9sZFdzOTXwzDIRU=;
        b=ZMdDd89jXKSsU0HjLaq9TiARvdvM08O+m2tb2gqX9p8zRMdCH6b35g5e86zlGJkYcw
         Ik3wzitxaNHOMMgLAnmmiAuLYlbi8I/QvCYYjsSnY6Jn2WcJFqif0zYxQ0cwEyzc3K2o
         mxz05+JlmKMmvmYlq65CcgSMfm+ZImoMFo1tqbYIVGIlS+oQrgSQv1POkcNgx8LQ9jXr
         Ss+66ffWfe1F9ETAiI/i6+PY0GeRv6lCh8HUXybthh1d+A7GHJ45PudmMZ4hwNLFKwR9
         ML1/5k6BCgG1gQLSWhmHkCSdooGCIJ7Lh88nG9Sb7FtKL9Oe2F2vA65f2bxgyLS8Wt6l
         +5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868684; x=1742473484;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdwK1Zh8ZZo6rwDf542VaxRAlTlQ9sZFdzOTXwzDIRU=;
        b=kjmXZ5pHeVBN8kPXYvE+dLEkHIzOEZGYF5QnDy1GjEuNJmULrvadIpvS35AWuNmFNa
         J8La5V3D2/pPKfS0JlBUVUdiCQ3c5HtWp0PHdlEBTHQYSZbRkwdUpBkFTdxffvlt712p
         SU1YonJWY6cyNpscBMNKfYw+vTLe+1SJK9BhK0b1YSxV0GS5o/TdtcX13QRf6FvsujO9
         Eq4CrjtZs46rx0Lpsb1/lAVbj8AGuqpeBga5Xm+iHbSSY/PtXLTKgJeygTfJVa6R4A7U
         vCUhZipu3iLDAYjClaInRLL5kjpj5KeEH8ye1oaPHBnjb2lZcqnFqkO1YcT+Fgc5D6TH
         oCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS/pM6DgUPfViETwaXSwy/YFy6oCPb+Mbb/SgqgXYEFiG+cV1/4cBh+l0ceTmH5rIjmh9rs9RM01o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNUQk0tmqkiG0hsM99PUioh79kJQwXC0fZA9o9z8zLMhwYnCzf
	DOu+OXXfIRqJyQhLlG0SoyUtCn0cX1t8jRFjO4llaiUl29VTUOnMxJliF9KxIWk=
X-Gm-Gg: ASbGnctiH/9LXQ79mhmt7jmV9LTr7SfLn+ZV6ie8pH+vKzrOWQJaXkzdL0P7j0sNrIw
	T+g8de7BZVrlQk5gJoOBbVJTgOOysXOf4IYIoeKXlvX/Cly/ycNAmPyfxzQ7s35+OjINoGHh4Hn
	5AZSZjH9vdgpcTKUWX1YYz9ejjjIdzNdx4CDFVLNSUX14TKNFm5pxdmqsD0OhixKsP+RqHG1wyh
	TILekNOOyivLz0DHOynYIupuJCqKNisGi+boYPYq6AzI1MEmmdjQYITRSuVL/ZZEw/bljhzM9Qt
	kqa5+5kQQo4/0NOdjIyLTV45xre13uji
X-Google-Smtp-Source: AGHT+IHTTFdUMyPE8J6/FJ/Tz2TmgEnvUPiqAP3Vg4LJA9U623EyzHKoPA3QMg0KCVbZ9Z4v0fkfMA==
X-Received: by 2002:a05:6000:402a:b0:390:e5c6:920 with SMTP id ffacd0b85a97d-39132d22aa7mr18761264f8f.3.1741868684583;
        Thu, 13 Mar 2025 05:24:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975b90sm2006325f8f.53.2025.03.13.05.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 05:24:44 -0700 (PDT)
Date: Thu, 13 Mar 2025 13:24:43 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v3 01/17] riscv: add Firmware Feature (FWFT) SBI
 extensions definitions
Message-ID: <20250313-924c6711597160f50c4cf90e@orel>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-2-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250310151229.2365992-2-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_052446_305649_6631C1A2 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 10, 2025 at 04:12:08PM +0100, Cl=E9ment L=E9ger wrote:
> The Firmware Features extension (FWFT) was added as part of the SBI 3.0
> specification. Add SBI definitions to use this extension.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Tested-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  arch/riscv/include/asm/sbi.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
