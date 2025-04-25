Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD98CC369C2
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 14:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiFY7kuaRQxuWpcXMAD3LcLRpdkbdCQ4pBgWcdGmw+U=; b=bbaHCb7kfDT4qR
	tQD+UBdmFubuQ2n/zPox1Ebb8ULHM1l1EDGV5LqbJ4Ijdi3t0fhc24AdzgnKgr3KyUFts26qSNnAo
	yhdaV9au3Awt+yLxgPzbmX1m29taIDpPdtL0dnzRbEGhzz3MjOvIQTIjhAFAAHGCUR6ZT4fFXehSV
	TJQ9mtPbuNSPHHVOT1ZyYgSrWlaHNuJtQ2pJjIo0hZPkojdr594HcHgg0792sOMTcSohn82o4O+O/
	MP9BkgwYHWtqWWKiA7nlNmenhJ+SoiiXPJyB5lwGK6y54A76a1iyox5bB/y028Tf9EEReFIhkiS0u
	WRS7cO/W35NFxP4x2WCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JkN-0000000HNzo-1ZZ9;
	Fri, 25 Apr 2025 14:09:43 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ik9-0000000HDSx-0nJg
	for kvm-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 13:05:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so21148725e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 25 Apr 2025 06:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745586323; x=1746191123; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mI4EMCjudvPEsRjkDPJuXzQzHFYKmrud5DGT+FL6aYw=;
        b=FYNSXBxSsZL6sGnzWtOwrHQBr9NVz9kuGqG767Z928sjUuISAEsmWknyLpUCYdQ5aH
         2goJNnTUm7mep9BVnG+6BkWltRpaufXtCsiioPWjJfyFFvNMSFamaaH4TIt9Bdl8DDBj
         Pg9myYNPh3VoIJev6sWWELn4+YzR767yJeYTQE7gQBat+DHH3I9OdxQywt8KDQZ3pvJT
         cGEJd+ykTP2sfcTtNY7GxHgjvius2L3hNRN8/S+swbj1T9pL0Ao2ji/gm0NlqWK/sAtg
         Zr4h4MUfGNThsUAAyCeLbWg8Jd6rEcXeY/w63qC2HHo0e1GkcEMBJREvH88bulcUg2Ns
         Z1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745586323; x=1746191123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mI4EMCjudvPEsRjkDPJuXzQzHFYKmrud5DGT+FL6aYw=;
        b=gaWaS0/IbDPI+9Hx8j4OMJ2P2NAVAs3/1TamqIp5WXR/uyWGRTpoLUnQ8+MWmO9cwP
         d2Bc0AQHd3qtn8Ab0arEMVVbjCDd1F6hUy1vo7irvQ14I7grYOXz5XcitAWHqm6MRvy6
         Z7c00cr98kkSzleI4VtVfj/9ADaNXNsAAdazIwVy45B0GlGOusTg1oSlTHQTHI5qLk3g
         Cif0vElN1kLpWC2MFz0Y+4Rqdpi8E9KS2kT485chZbIsq9WcKuL0znPQUVxuqgQSJ9Yn
         2C8rgxzCRrI28fjOsre43m5p632WBDcbSvTVqQEGsWu3urkyKVj+q7d8xsL5ZWLY2vjR
         fUAg==
X-Gm-Message-State: AOJu0Yy8SAPFQsrmNZ7P0nlw8WxjC7iydoEXMhMHIAHrTbG+FGFH4zZp
	RLeuaCZOFK75LE3/b/j9Srm2+heP1V+DSNQuAYwFdBLXvzWpqZXTYlh7FGXCzs4=
X-Gm-Gg: ASbGncvukAsA1NjCc51TYSaX7sqg310SbKxTAdrADOfd5z27igJ0QxlTjvkDWzc9s7S
	f+XPQqydIom+J7G0zaePzZBQ25eucbRKggt6JyhpFK6ZJ56Vin9AL0lugN5hNcl1ZYIoMqEgdMj
	sA2P3l5Zip8JfA1OeAEKztB2qKhKEO6x5Orgpi3SzEiFy3hH1C6cMxj72Kng2F6FMNM0a0IXSYS
	0NS6blvo7RCOirW9b14qKwAYiCTYVRtyEsuMryjpxZJ0f76vnWnXAD2eRUgcKyV7TAxAeVw59Jy
	NKA8h5bB9NEhFf6ejE995T45RhT5
X-Google-Smtp-Source: AGHT+IHHErR6NhpMN/Sy9UBcv9Lon9rgyckgM6zPHQxQJs/5oK9vVCdwR1q/Yg1TRreW6QGAYcjYIQ==
X-Received: by 2002:a05:600c:a06:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-440a65d8e66mr16975955e9.11.1745586323513;
        Fri, 25 Apr 2025 06:05:23 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2dfc2fsm55718985e9.33.2025.04.25.06.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:05:23 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:05:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: Re: [PATCH 3/5] KVM: RISC-V: remove unnecessary SBI reset state
Message-ID: <20250425-adf6ca95915c46a5403fb742@orel>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
 <20250403112522.1566629-6-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403112522.1566629-6-rkrcmar@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_060525_219519_334F75F3 
X-CRM114-Status: GOOD (  12.06  )
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

T24gVGh1LCBBcHIgMDMsIDIwMjUgYXQgMDE6MjU6MjJQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IFRoZSBTQkkgcmVzZXQgc3RhdGUgaGFzIG9ubHkgdHdvIHZhcmlhYmxlcyAtLSBw
YyBhbmQgYTEuCj4gVGhlIHJlc3QgaXMga25vd24sIHNvIGtlZXAgb25seSB0aGUgbmVjZXNzYXJ5
IGluZm9ybWF0aW9uLgo+IAo+IFRoZSByZXNldCBzdHJ1Y3R1cmVzIG1ha2Ugc2Vuc2UgaWYgd2Ug
d2FudCB1c2Vyc3BhY2UgdG8gY29udHJvbCB0aGUKPiByZXNldCBzdGF0ZSAod2hpY2ggd2UgZG8p
LCBidXQgSSdkIHN0aWxsIHJlbW92ZSB0aGVtIG5vdyBhbmQgcmVpbnRyb2R1Y2UKPiB3aXRoIHRo
ZSB1c2Vyc3BhY2UgaW50ZXJmYWNlIGxhdGVyIC0tIHdlIGNvdWxkIHByb2JhYmx5IGhhdmUganVz
dCBhCj4gc2luZ2xlIHJlc2V0IHN0YXRlIHBlciBWTSwgaW5zdGVhZCBvZiBhIHJlc2V0IHN0YXRl
IGZvciBlYWNoIFZDUFUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3Jj
bWFyQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3Zt
X2FpYS5oICB8ICAzIC0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEy
ICsrKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jICAgICAgIHwgIDQgKy0tCj4g
IGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyAgICAgICAgICAgICB8IDU4ICsrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAgICAgIHwgIDkg
KysrLS0KPiAgNSBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMo
LSkKPgoKUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+
CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
