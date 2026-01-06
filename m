Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A707CD0439
	for <kvm-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 04:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xUvO7/MrEA1FNlVjd5JHulcpzvrFH81YIy0Z8We4VZc=; b=TOMJ3JjVwSWbEF
	RhU3BFTKl0fxvrGRFBXPW3UegB3P6rA7erlHoXOPZ9g6axHciaDX2Pm6/QcUkR19Vi+mUyw7147WD
	0L+txbvXOMfGJf6WdhhbA/BAHdmTOf2ttcr8P4aCMWK6ph+h9yCsoynMcBhkyKQD7tnxVQTBUpnrZ
	7yLhzoXM9peS42LnJ+tNEDWnwP5zUOYKdLbzdunWI1WSac7I2hbn8ZgCNQ34F9WKUWpFLCUU0rzQY
	SiihQntYUmNcx9j7r2pCfP9JOQ5gJ2yZ9/acK0/MpJFl3TKho6sEWRcWS0WhayZUUux5IMx8VlWku
	bxkCbBDarRuXIudiDkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7h-0000000CQ9n-3Ykz;
	Tue, 06 Jan 2026 04:56:49 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcz7f-0000000CQ8D-1SZF
	for kvm-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 04:56:48 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-65d132240b5so328050eaf.2
        for <kvm-riscv@lists.infradead.org>; Mon, 05 Jan 2026 20:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767675406; x=1768280206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXCgyGXdfFw2jhIVzlU19gmITjYf/onAsSkhutvgS3M=;
        b=zZh6BZYgQwcAWyxfj8r/aThMAMh60QyYp3wE+nYco0Kyz79tPhupff+zCYtiNSAMuY
         sNAuGHI42OTbUUbAXGnQM6ZG5ECTu6Sy507QcG/UYQogEczwcozOObfXWN1euf+QoUXu
         AsYwxhC+UwcYVFEd6P2wBAelYz2RJiUSApyCLVh1EGn0e+iIRVM4eqtTTeNXPGnb6bjx
         sfgWQoJft+ZI9I9Z9X+J00hlt0ra+tzXRrEbxbbAKwow8T93oGlMqhahBhjnKutXD2GY
         Wo5EcsT+cB0d+r7YGuy+hrsiuVZQpem9RdcYiVjQHxf3qLLbXSh75wlfXKWsaBdcRXVa
         I7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767675406; x=1768280206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXCgyGXdfFw2jhIVzlU19gmITjYf/onAsSkhutvgS3M=;
        b=n2zL6lllFWow4B3vfc7Nw5b7OkogUVkYbeRrbrVh6uAjB+9/jWJHdjYKRQmb0IhHCT
         ST31/e/lXvGV/ncO0E8k3yqOr6nuKejWhjzqBAx+KPogD2wx1H7/bFqkA16eFaJQc/mw
         R47DZTJmdjzE00p1s4tEzhBjfcWuHSt4Pn5oz+8gFwz7JGgk9Pkz8viYxxpW3OqdJFnU
         JZL3uvT8HYBzQbm0Wcd+2m0tuH+Pf7e3+kQ6bR0nHGzyc9p8Dk3m7WGN6fEx7EB3GGTM
         tiePRaCsnJK7jdgmmDrhbiW7XAfVrnmTxauV2tFF1Bfb7s/rwYzr/Hl1icmXR1/h+F8D
         QVPg==
X-Forwarded-Encrypted: i=1; AJvYcCVVbC2N4PQst2zlRtophA9Dm8o4MR/AU8M4ELR6y6OZihKsGH5me80QRW8B3sFr75ySIG9dymoq2As=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6gl2u0pT+EteQE07SRKe4k6bY5IiyyckTJHDmBmtEzoNjL9Hm
	R4xAX3WM95v3r+VCjJvf/LS8NrrMDhk0gWe0vei50ZdnzYYRSC9y/mAQLOapMBRix1dQgoncTnD
	0jhPfsdUosm2IOcdHxvFxfoa9rPysiSbO9lbMYwVkNg==
X-Gm-Gg: AY/fxX5iRr0aieTqIHjd9sgVxj2CquOdlQ02ZHnOmhHQkbXoVFmcNCThLfcunudxdVh
	jn6nUc6fyDPIjGDQk23GU/QpnPH5FVBQBpjEJXNMkCypzSLfa8KtMWqXCX1GlZ8AFUHOh8i1vZf
	g7TKkJrj0LgDzfEe1pgTmkGHU2LJ+fJXEMEhZsld9edymfXqlzklP3jruY0Wnqui/cLlSWu/J70
	bPfbd23qKsFbaORG8xvui+mEpeLvPRhFgdQNyELOrF6e9lz1jV/doUtDHCV30CC+H/koJp+dciS
	A9tEFeoZg7VF4nAZ4MU0pkDPt4o083ZMuquPXH6u6CBgN30XLbO05ekJNQ==
X-Google-Smtp-Source: AGHT+IGq83xsWiBnk8S8Wan7SqZp6GnFrv0pdr0Nor1LjDGkvPMfuowdAk7rc0hTsmwGhsAqXr8Xk0551qnx4JMiq/Y=
X-Received: by 2002:a05:6820:2202:b0:65e:f37f:93a4 with SMTP id
 006d021491bc7-65f479d332fmr1135768eaf.8.1767675405972; Mon, 05 Jan 2026
 20:56:45 -0800 (PST)
MIME-Version: 1.0
References: <20251020042904.32096-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042904.32096-1-luxu.kernel@bytedance.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 6 Jan 2026 10:26:34 +0530
X-Gm-Features: AQt7F2rV_3WZCrB_VJwYGn79psT6Smtly97t591oPSUibomNxLFKeK19i9dMZfQ
Message-ID: <CAAhSdy3M8NMF0ojJdoSvtate6FRjS5hno2Wc5i=TeCF84yOK3Q@mail.gmail.com>
Subject: Re: [PATCH v4 10/10] RISC-V: KVM: selftests: Add Zalasr extensions to
 get-reg-list test
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, atish.patra@linux.dev, 
	pbonzini@redhat.com, shuah@kernel.org, parri.andrea@gmail.com, 
	ajones@ventanamicro.com, brs@rivosinc.com, guoren@kernel.org, 
	linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_205647_411401_35D855BF 
X-CRM114-Status: GOOD (  12.63  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgOTo1OeKAr0FNIFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPgo+IFRoZSBLVk0gUklTQy1WIGFsbG93cyBaYWxhc3IgZXh0ZW5z
aW9ucyBmb3IgR3Vlc3QvVk0gc28gYWRkIHRoZXNlCj4gZXh0ZW5zaW9ucyB0byBnZXQtcmVnLWxp
c3QgdGVzdC4KPgo+IFNpZ25lZC1vZmYtYnk6IFh1IEx1IDxsdXh1Lmtlcm5lbEBieXRlZGFuY2Uu
Y29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PgoKUXVldWVkIHRoaXMgcGF0Y2ggZm9yIExpbnV4LTYuMjAKClRoYW5rcywKQW51cAoKCj4gLS0t
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDQg
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCj4gaW5kZXggYTBiN2Rh
YmI1MDQwNi4uMzAyMGUzN2Y2MjFiYSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiBAQCAtNjUsNiArNjUsNyBAQCBib29sIGZp
bHRlcl9yZWcoX191NjQgcmVnKQo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQg
fCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQUFNTzoKPiAg
ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lO
R0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkFCSEE6Cj4gICAgICAgICBjYXNlIEtWTV9SRUdfUklT
Q1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhU
X1pBQ0FTOgo+ICsgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aQUxBU1I6Cj4gICAgICAgICBjYXNl
IEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJTkdMRSB8IEtWTV9S
SVNDVl9JU0FfRVhUX1pBTFJTQzoKPiAgICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhU
IHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkFXUlM6Cj4g
ICAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SRUdfUklTQ1ZfSVNBX1NJ
TkdMRSB8IEtWTV9SSVNDVl9JU0FfRVhUX1pCQToKPiBAQCAtNTE3LDYgKzUxOCw3IEBAIHN0YXRp
YyBjb25zdCBjaGFyICppc2FfZXh0X3NpbmdsZV9pZF90b19zdHIoX191NjQgcmVnX29mZikKPiAg
ICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBQU1PKSwKPiAgICAgICAgICAgICAgICAg
S1ZNX0lTQV9FWFRfQVJSKFpBQkhBKSwKPiAgICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJS
KFpBQ0FTKSwKPiArICAgICAgICAgICAgICAgS1ZNX0lTQV9FWFRfQVJSKFpBTEFTUiksCj4gICAg
ICAgICAgICAgICAgIEtWTV9JU0FfRVhUX0FSUihaQUxSU0MpLAo+ICAgICAgICAgICAgICAgICBL
Vk1fSVNBX0VYVF9BUlIoWkFXUlMpLAo+ICAgICAgICAgICAgICAgICBLVk1fSVNBX0VYVF9BUlIo
WkJBKSwKPiBAQCAtMTExMiw2ICsxMTE0LDcgQEAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyhz
dnZwdGMsIFNWVlBUQyk7Cj4gIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemFhbW8sIFpBQU1P
KTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YWJoYSwgWkFCSEEpOwo+ICBLVk1fSVNB
X0VYVF9TSU1QTEVfQ09ORklHKHphY2FzLCBaQUNBUyk7Cj4gK0tWTV9JU0FfRVhUX1NJTVBMRV9D
T05GSUcoemFsYXNyLCBaQUxBU1IpOwo+ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHphbHJz
YywgWkFMUlNDKTsKPiAgS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6YXdycywgWkFXUlMpOwo+
ICBLVk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpiYSwgWkJBKTsKPiBAQCAtMTE4Nyw2ICsxMTkw
LDcgQEAgc3RydWN0IHZjcHVfcmVnX2xpc3QgKnZjcHVfY29uZmlnc1tdID0gewo+ICAgICAgICAg
JmNvbmZpZ196YWJoYSwKPiAgICAgICAgICZjb25maWdfemFjYXMsCj4gICAgICAgICAmY29uZmln
X3phbHJzYywKPiArICAgICAgICZjb25maWdfemFsYXNyLAo+ICAgICAgICAgJmNvbmZpZ196YXdy
cywKPiAgICAgICAgICZjb25maWdfemJhLAo+ICAgICAgICAgJmNvbmZpZ196YmIsCj4gLS0KPiAy
LjIwLjEKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
