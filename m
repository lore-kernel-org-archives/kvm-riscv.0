Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19EB4C369D3
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 14:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95ppRLu6o9Tv+z7NFcKcUQYfPUnduO2dIefcpGu+0TM=; b=h1gCY9j22ny5zt
	1ExvIFCrgLCL7rFgX6pRGnbIluEOjdnhMRtpn7fPKZyCsYSwmMb+C018Wr2A66mLdPWlzFCbNSYeK
	oiSaul+Q/5PMmkhLmRtNZDUPLL+g7Zhkgf2rueXh+OlRl8KB7l8qH+HmhGgVTxKyQFMKRJ3RHp2iH
	accLpzP0TNNpwa6dhJYdnu8r2+xo37vOI7+Qd1qGZxlFLmSRLz57LeCgHdvqXSdcZqmAryqWIqCfN
	kDocGiGGJh3oiGLz1bUrsVkM9upNoTBGHirykRDInIxXMq+0kQnLSDgYorgTd+BDHQazOGu9EUntx
	8+bzbi50A3dTYrM5L+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KBH-0000000HSjL-3Z8a;
	Fri, 25 Apr 2025 14:37:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Idi-0000000HCcF-1FKs
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 12:58:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cfe574976so15913975e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745585925; x=1746190725; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h32MpWGnGgpxDT6AyOuIJQcbaczCBtPKdaZ9N2BrcSA=;
        b=TylzLSPCHxvZr7e3dtnAaK0zhk2FFLz3LcU+rKAEU8v0/OE0h/MhfnVADMAo5vv71k
         Gs8Vj2wHvKBN4Dy4xEeeGS5ObS7Uj1GJhwbqw3dZ1q3jv20Gv0PqXrsZPlzX4tW3miZO
         eZFYKN9TLR7e2zA5/c2/xR0I19KuNQnzS9oNX0F1uYgfviVMCCcym+SZbBbViPV2VPrb
         WjaLdv50VKluTvyBFe+eEmpUne7LoY3xPuG8N8w7og3Tw1lwzZDAoTlGhwWXmWR0NSXu
         YFDoLAXBH4MNmsRIITre5eDVhPfY3xebEBojnXi3rX+i6QQ9ERilo4CxfySiy7x3Mz7/
         nLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745585925; x=1746190725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h32MpWGnGgpxDT6AyOuIJQcbaczCBtPKdaZ9N2BrcSA=;
        b=vNypMHE/fulL5cYMutPhm2NdaclLlvhGjz/PkjnT4GHOmebLF7MpjDShBX+e6x/T1y
         ZjhiOf34SXZf7TzSeDbqEVq0GAGc2Xs3PjMnR2apAAQGNx5Gg/TUHeQDuMvyl/K9daAU
         uFCrOqtc04019MLYU43NKM3sap/DFfHKzwiM4yAp9ML9NnSafu05VdXokkwy20hYOGEk
         xCrwcPKx+UtpNJxvKNEWV46B5UmUK8ggpL2gxqR52DrJFtE+wDcj3hNZrRPs8pqYvuNX
         dZrF1nRqtPvonVhyUpXYIawamgF2YguXfoZ3/CqK+eazRc1ktIpIlLjDXGl1RL2+LzBD
         SThQ==
X-Gm-Message-State: AOJu0Yw2RWqJl3Zuu4bFipXmHlxjS+fa/jYN0ykJ0j7axbsu5B+7mvK1
	tnHcd9ejcKdc942Nk6Usy78Q53xR3Wk+fsCTh6V5h8quVlLjesYlYxoLEQLmYvs=
X-Gm-Gg: ASbGncs4L3NZiOkOTf2d1QgCNEoFIDqDUus4SKpKnhi+tB7c6fDnLYrBD/WKztz+jdu
	fIzp01b+kWZfUbIvQVaQA3x5yPIB0sDYTa3eEGRu0hNRTEznbx4/JY5UD22Vsq/ltHnrzPLJ3Le
	alTNaCgY2ML8j6V2hVw49x1cpLR+Hk1pb1NmOHqvntd3Ci3l80FCcDcKPIJBNNmiNQpp6Xbg7es
	xiwCHNDsEykdw8VmjeIxigcsCBMeJ5DT4YWYbMbBelLnY0eo3mIfBzeIsLWk50nYI7+BWT0pJ+U
	YQkftNY4ZBVjf+f53OgNIWOPQZ/v
X-Google-Smtp-Source: AGHT+IH1o3+pe6w45uhSEWnsxZ3kyB6TJbP2MLFTmjrjISo8GMvqrB42OloPKpF+TK2iDyjwzSvPYQ==
X-Received: by 2002:a05:600c:1e0b:b0:43c:f81d:34 with SMTP id 5b1f17b1804b1-440a65e2c51mr21114245e9.9.1745585924890;
        Fri, 25 Apr 2025 05:58:44 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5369cc1sm23902615e9.32.2025.04.25.05.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 05:58:43 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:58:42 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 2/5] KVM: RISC-V: refactor sbi reset request
Message-ID: <20250425-65f6d6913f9f621dbc8c4479@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403112522.1566629-5-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_055846_331052_44F251BB 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MjU6MjFQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IFRoZSBzYW1lIGNvZGUgaXMgdXNlZCB0d2ljZSBhbmQgU0JJIHJlc2V0IHNldHMg
b25seSB0d28gdmFyaWFibGVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2t2bV92Y3B1X3NiaS5oIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgICAgICB8IDEyICsrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9oc20u
YyAgICAgICAgIHwgMTMgKy0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9z
eXN0ZW0uYyAgICAgIHwgMTAgKy0tLS0tLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQo+CgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxh
am9uZXNAdmVudGFuYW1pY3JvLmNvbT4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
