Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC328CAC587
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GULncDThm2VHr1q8+B/2jak2Rb6Va6Rm0ah9MSsV2b4=; b=hJ6sg7hc5s3Y/T
	jMquI3TRLR0GmxvDMMPbjjoYhNb45e1AdxwjuaQJb/CoxCOtRQvrnkSf9LgRz4aJhWFWV3CwKVzOS
	HrJF5wHjN45bQvrlpUGTzqrBVulycLpGQfkfKxf/VyrGKzm+GY6bw043/sEXsMtJbtxhHOsY0WLqC
	703kudMGr2JYA3rSNGtfzk2cK+xStxQrfMA2OA6xfYWHNC2eOOrotJwKEvswNblTpVE7GJmgdhyof
	H5E+OQHuqdFqlJsKYbUMp3dH6wSw77F7oqE5oM3xMDYIcl9vVtfdiYxocxii+C1gsOq2QRSD05XqE
	rpyrT2mMY/CfMEajMuwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsDR-00000004rSr-1Sla;
	Tue, 09 Sep 2025 06:52:33 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlDB-00000002wEP-16Un
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 23:23:50 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-32d6c194134so2736167a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 08 Sep 2025 16:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757373828; x=1757978628; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rMdsxD78c5AGa8Wex3l5Hmbkrt5qXXCa5r1uDm/sEZo=;
        b=gYZ61Rub9y25rgbV9+8GrMMouz3BiYS0N41DvcvLMFvbol4M0VWJH5BWr0+yJYWV5x
         3Eh4rkJ+pdCBPyzfE+BpqyaC6bmlvzXqnZ5Amz/UIetMAAwwdFzKKPtn/fYYk9CbBrsi
         AhMtAa723u5/ZzJTt0bbEvSw1m9DoGC2p78e98relkPGN+zXGhii8VgLsSR6Xh7qTNiM
         k3WDbdm1iggz+PhOVC1Gkz/PT+sa0GMauPyqw+HhzVFcr79rOKvtUuHQW6/pTqu6np9h
         eidNV/bqG0EI/8kJjeWlGAbc/B18PzpEStFBSWxUDRZ1vDjDBDt5fP00jZ4L6IayUqrd
         IuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757373828; x=1757978628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMdsxD78c5AGa8Wex3l5Hmbkrt5qXXCa5r1uDm/sEZo=;
        b=Y4fwhGuReMH5iXnT2F3SgEJQlIqjWr9n0J1FVAFZ8fm8MzM9I9D6pzxh8gopO08etw
         2nRjaOsm9wpGP1o2qtNy10y5mboGvkqw4NpTPt1KU+KzOJb1wBvtC9EJUtIEU+lKTyRH
         kATeKBhz28X4HJwoESTOBUKe0CntH0zoQUdDvY2b6XEOpJlvD0cbLSn9R59slTc5d72e
         RNuasms2yeX8o3BT/qBAyYD/3iqLjegIPykVFAvIsWscydfon+dEYhGbs0b5Hk4w4kda
         XZ4WSNsgfRi08nYDefanfCPglLxKIw4pwz287DA5rIXIIQSUw6u0bBox/eoBL/w2lTIu
         dIjg==
X-Forwarded-Encrypted: i=1; AJvYcCXXa8iVPhsw4kmtLSLRbggQhYFGRsmLdvTK/RLVHa2g9ISGhEgY79CDLlyStpT+YlegcKfFZA10UbM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdFQPk0m5RjgBJBMhUwZEzixilvHSI3Q9KxAIP4Dg+1koJpEoN
	wxvzDc/m/IfBhR+ETBBbgVmEm0N0HAANi61hLzTs022nFzcBqZWepBCX
X-Gm-Gg: ASbGncudHh03CMr2G2Cz2+cHl6hXlUEy99X5OKrq3NU04In6FGko1+Ty90xQahX0jBJ
	mPaIC2aZUS3kzwg5nMLpnC5+8hdQYNU0Pb1ufkb1kcu5Xr8N94qHpt3pCqxcAW1h9728XxZWwfe
	ipmM0lWbkqZMDFTiaOZ6Z06zFEDOgJ75Hj6DBw/bPpnJtgsjRJ82vmc/ArxZoKQjbJRrvpavbVS
	GYeQMuN622IEGkvbZZR6CVFh7FcBQl+Ix3X6WsvB39cX29FXNli3jrM9r/Nb5HO0SK+9LFC2bYe
	uzYGFuemnKmts+4HKaClbvL/1CrwJh0CgpedZUWKzU+sBd82OUXK3PJN1bUxhg4gydzVVmKUmlL
	32LHDDl2RWdsucwt/8XbU5evAPTZVf4pvJJrHr/AvRBU7YvucQEb6n+Nm+XpMO1K66O3RuUvhZp
	M=
X-Google-Smtp-Source: AGHT+IESUGdWe1Ee/nSWwGznnF2h0Olvcl9CCgYGvnoxn0qsqim4i4l3afIwjw/qsfBLtixFhzv5+A==
X-Received: by 2002:a17:90b:3f4c:b0:32b:6132:5f8c with SMTP id 98e67ed59e1d1-32d43f772c9mr11822967a91.18.1757373828398;
        Mon, 08 Sep 2025 16:23:48 -0700 (PDT)
Received: from localhost (123.253.189.97.qld.leaptel.network. [123.253.189.97])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32b92a671afsm5474922a91.5.2025.09.08.16.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 16:23:48 -0700 (PDT)
Date: Tue, 9 Sep 2025 09:23:44 +1000
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Huth <thuth@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	kvm-riscv@lists.infradead.org, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 1/2] build: work around secondary expansion limitation
 with some Make versions
Message-ID: <c3itqe5wfydsn2euacwea7kogwomd46izempw6jyu5uhi7zbax@yjiobbuiembh>
References: <20250908010618.440178-1-npiggin@gmail.com>
 <20250908-8ebb10e1e917a5befd6b5f44@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250908-8ebb10e1e917a5befd6b5f44@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_162349_307312_9D4E6142 
X-CRM114-Status: UNSURE (   7.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Sep 08, 2025 at 01:22:01PM -0500, Andrew Jones wrote:
> Missing the kvm-unit-tests prefix and, for this patch, the riscv prefix.

Hey, sorry about that, been a while between kvm-unit-tests patches,
thanks for fixing it all up.

Thanks,
Nick

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
