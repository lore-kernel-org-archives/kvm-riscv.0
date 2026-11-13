Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A65606A332
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZrlSHQPW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=jzBn7/Ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Sa70BvenE0seJAeaTteN2Mli3tKN4SCyJl1TE1Y7YFU=; b=ZrlSHQPWOBQJt/3iTbRIyOZmhU
	imzvYcQWMEoLcN+1vfHmsAqckDSzWZgPHp0dCwLIZ1xT8g3oegJI1t3EFA/exVVhqnF9jpnBbvGtw
	+o0ZvLljukMlfYXNZ/vWN5augvSc8NOa33v+I4dE1hvSGGthaz147pIgNwF1Enn1qlX88PbOJG2CD
	8rOUeO/dEC2W62Dp8vG747RgWobPU0qHhnjZFT2v9rHDEOfCrMBJ1yMXOdATgXdfcOzRFitgfHOXU
	ITmq+ZlO8xxRva7Lf6tsWZMcykXzPh890FKwV61eBZvNNJ8rPHLHlT/GTZxHE4Ep1RscutHnzTJfy
	D4XBSyvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpt3-0000000CbAm-15A8;
	Fri, 13 Nov 2026 11:56:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpt0-0000000CbA3-24Qa
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:56:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4918c2d727fso378463f8f.3
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 03:56:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794570964; cv=none;
        d=google.com; s=arc-20260327;
        b=NxqzQ4uX3WoyPNp/PEGsdBt8Qis+jKDhgujx9dAqdxECOofEpSLc2E47t+708YAQXi
         rhQNsuZ1l1N+yQmSLIJ22aEXuslWgXEnbK/1thQA524Nmg2PJkt9zrP2nczslx7YDivy
         oKfDUpTtGM58ZXRBakwy0ORVuV9xjgCAbIRzDT0wGUBpoUw2sfW7Pqn+7oVlhDnSvfVZ
         R9QC8uLuByDIzFf+a1MIAAEQzMeukXuwcdyYRSxNnUCV/w94QG3cVwzfYWM0iFQwDGp0
         W3oWhZpVo2wzFcTNRAGxeoInQw5reUcH6Ts4N+zKujpBR9JXPJSoc5Zpxq4Xu/Z3ExV6
         BOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iQQDL3pYNGN1ebIB9amik4UbHY4EdHlPUDp6txsCFwE=;
        fh=23xPEM/gMgBaPBIyx6Zdvgz/K4PdCmSH5F2WWf9m7XY=;
        b=g8aBhJtV9glBjrZap5lNGINvdmR2zaqbgxDozw+kzYmalrP+qVVsJvPGdNLt1UKOlG
         AQPCE+4RXuUGJFpNR5Cp72p+f8fEG3q2Rnxab0juIgXV1GcuRvhHdONiCJGS2m4QoTBF
         GyGQ0ayNOdLjCQgTtDw1++YYlsXMJ7ffQb1Gbe/AT3ZG2vEeJcqT46Qoj+4Kf+TZKrYE
         f7S2g8IYRGwco1096ainuJxQF/O5xV/wdiAF87fXljR+dIE9mgyYXaifTXJhyhQZNdlM
         4dn2+Wk1GhYRjJ9Kp4NbyNcHRzBqnPRwkDPo4TD4v/JzCwnknx5UMB862WG6X3vlFY5Q
         OQVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794570964; x=1795175764; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQQDL3pYNGN1ebIB9amik4UbHY4EdHlPUDp6txsCFwE=;
        b=jzBn7/NgReVO5EX54ErbTJutUQxMkd8DQji57zerct5JGnLJleFED/mNESMduptgL5
         Fva26urIanXSQWAZ+fVuUOAbGFpsMW83kZQaz9KZzCDAuUcxfS5qqy58XW8Aat6Sh5oy
         bGokY9thOE9kdyw/TH1B8abUGKb3Qq5NOUEe7GKrNuWU1l4EAy72XdphlEdhJsYUb0iM
         tEJnqCOUwUdhu0GOcFv56ETCPhEdIkoxhaBXA+2Q/TES1PEgNNLTIBupDVe5p3QTHAV/
         MLNb5b1JmOFAaCSmV/qTXU3nHrvXHVa4MRAXhcix3VXgyYjmzLQv2c34hMEj5tLM9GC9
         crpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570964; x=1795175764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQQDL3pYNGN1ebIB9amik4UbHY4EdHlPUDp6txsCFwE=;
        b=g4d3F5nIfQ7IO23S64pk9H3J7IYCsPXOBmD9DE7LqV0VTf2q1AJ/ylFi7mM23nj8JZ
         m5waw6IwTT8xrhj6hrGH1aKy9pxuZYmo9kue0YqTNNTZhv5vvxeNbbwGU46drABSdvki
         KFLgSq4OAHpAu0TLhz0hXfQvn9oLuW16eQHtqK9shnFxATOBaLUS52Xtvbfiv2lJ+ZFC
         TiW+X+9rmo45UQx6kwJo6TdeKN//Sw4WTS9jnIgpUn4DnpE9Heo8QxGz1c7OVasxdR2P
         qZXhNMYMaQGXsViM9+f8SXOIpbhiYBdmR6G5p2K/b/5+UJfZXQ7iiI5x8pic9wDFpUAc
         5BOQ==
X-Forwarded-Encrypted: i=1; AL+hErGORB4sbVRSrzewf0RmKyirGrzsbuWqNZ7JEsaDD8iAy95BSXbPa6Wcevy71WejKhox1iMF80UelCE=@lists.infradead.org
X-Gm-Message-State: APuU4Z8WYMz9UkrDb1qjs/5Z15nVQZg2tk5tshx1NGug/YlIO0PkmJ7+
	hbJinGUQd/TYMAqGCGtRhNyEsWjBHuov2ZiN7FlEvLqesaFQtfcik+yGwCKTZvzWxGVzApAV/RE
	G1CMEoIpZiXMNx9RtRmb8mH7UBIxFTgl+eRpibeQ/Ag==
X-Gm-Gg: AYBFou3Bw4HmdECFToCvyANQ5uNIWEilBVhUDOLdA5BQjtOxJFf407m2ZbR0qqkj5Jt
	7M+I8GezM3Qf36gVwczVo1obFmfe8AfVYD75GpQUxO3znsaMSbZ1SvwHEa57fW6xH/400WdoPis
	S8RBfzoFqPdqNJmzu8M6QinNNaa1mn9soW32aubMfjZ7oISD/Sq3AVeQ7w33qBOrBsEA1A23Wbs
	+uQQTR2W1mZR20XdhOhgz78NR2FV1T8/s53LuasnS5IiQZcES9igY1yb3RRg5kO+eLIcUpjrS6L
	uThQJldoAicHeY6LydQfygCpYxy9Rv37ety7iROvGnE21KbZvYNkHzx2ltiZbTg6ORcLwRgnG5e
	9ZUcb8k/tncx7BIUtLQMY4/lDW0yDZFAqBcZ/KGx5yRaO6uFl3MG8rCxvJBkhkDaDazMTEhIp9E
	gvuVOo8dwcC3FSLSNyMD9CnOqysu77uSi9jdApgQ/3Y61zJTRZekx9K0w=
X-Received: by 2002:a05:6000:184d:b0:48e:e98:8b64 with SMTP id
 ffacd0b85a97d-49c70ed94d3mr5665274f8f.19.1794570964467; Fri, 13 Nov 2026
 03:56:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028190531.48302-1-mikatammi@gmail.com>
In-Reply-To: <20261028190531.48302-1-mikatammi@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:25:53 +0530
X-Gm-Features: AclHuK-4iNBUWXSJCnX1Ef0NFWzcQb-T2Pd21cO1oNlOHRmmN8PuRx7zLiPDtnY
Message-ID: <CAAhSdy2fp-JBor--AhNoLzpjjis_wopPY4ZTRpEvABu0SHvzsw@mail.gmail.com>
Subject: Re: [PATCH kvmtool] riscv, arm64, powerpc: Align the FDT staging
 buffer to 8 bytes
To: Mika Tammi <mikatammi@gmail.com>
Cc: Will Deacon <will@kernel.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, kvm@vger.kernel.org, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_035606_559070_C9FFE7E0 
X-CRM114-Status: GOOD (  24.37  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjksIDIwMjYgYXQgMTI6NDfigK9BTSBNaWthIFRhbW1pIDxtaWthdGFtbWlA
Z21haWwuY29tPiB3cm90ZToKPgo+IHNldHVwX2ZkdCgpIGNyZWF0ZXMgdGhlIGd1ZXN0J3MgZGV2
aWNlIHRyZWUgaW4gc3RhZ2luZ19mZHQsIGEgdTggYXJyYXkKPiBvbiB0aGUgc3RhY2ssIGFuZCB0
aGVuIGNvcGllcyBpdCBpbnRvIGd1ZXN0IG1lbW9yeSB3aXRoIGZkdF9vcGVuX2ludG8oKS4KPgo+
IFRoZSBEZXZpY2V0cmVlIFNwZWNpZmljYXRpb24gcmVxdWlyZXMgdGhlIGJsb2IgdG8gYmUgYXQg
YW4gOC1ieXRlCj4gYWxpZ25lZCBhZGRyZXNzIFsxXSwgYW5kIGxpYmZkdCBoYXMgY2hlY2tlZCB0
aGlzIHNpbmNlIGR0YyB2MS42LjE6Cj4gZmR0X3JvX3Byb2JlXygpIGZhaWxzIHdpdGggLUZEVF9F
UlJfQUxJR05NRU5UIGZvciBhbnkgb3RoZXIgYWRkcmVzcy4KPiBUaGUgc2VxdWVudGlhbC13cml0
ZSBmdW5jdGlvbnMgZG9uJ3QgY2FsbCBpdCwgc28gdGhlIHRyZWUgaXMgY3JlYXRlZAo+IHdpdGhv
dXQgZXJyb3JzIGFuZCBmZHRfb3Blbl9pbnRvKCkgaXMgdGhlIGZpcnN0IGNhbGwgdG8gZmFpbC4K
Pgo+IEEgdTggYXJyYXkgaGFzIG5vIGFsaWdubWVudCByZXF1aXJlbWVudCBiZXlvbmQgaXRzIGVs
ZW1lbnQgdHlwZSwgc28KPiB3aGV0aGVyIHN0YWdpbmdfZmR0IGlzIDgtYnl0ZSBhbGlnbmVkIGRl
cGVuZHMgb24gaG93IHRoZSBjb21waWxlciBsYXlzCj4gb3V0IHRoZSBzdGFjayBmcmFtZS4gSW4g
bGt2bSBidWlsdCBmb3IgMzItYml0IFJJU0MtViB3aXRoIEdDQyAxNSBhbmQKPiBtdXNsLCBpdCBp
c24ndCwgYW5kIGxrdm0gZmFpbHMgZXZlcnkgdGltZToKPgo+ICAgRmF0YWw6IEVycm9yIGNyZWF0
aW5nIGRldmljZSB0cmVlOiBmZHRfb3Blbl9pbnRvKGZkdCwgZmR0X2Rlc3QsIEZEVF9NQVhfU0la
RSk6IEZEVF9FUlJfQUxJR05NRU5UCj4KPiBhcm02NCBhbmQgcG93ZXJwYyBjcmVhdGUgdGhlaXIg
ZGV2aWNlIHRyZWVzIHRoZSBzYW1lIHdheS4gTm90aGluZwo+IGd1YXJhbnRlZXMgdGhlIGFsaWdu
bWVudCB0aGVyZSBlaXRoZXIsIHRob3VnaCBpdCBoYXNuJ3QgYmVlbiBzZWVuIHRvCj4gZmFpbC4K
Pgo+IEFzayB0aGUgY29tcGlsZXIgZm9yIHRoZSBhbGlnbm1lbnQgdGhhdCB0aGUgc3BlY2lmaWNh
dGlvbiByZXF1aXJlcy4KPgo+IFsxXSBEZXZpY2V0cmVlIFNwZWNpZmljYXRpb24gdjAuNCwgc2Vj
dGlvbiA1LjYgIkFsaWdubWVudCI6ICJUaGUKPiAgICAgZGV2aWNldHJlZSBibG9iIHNoYWxsIGJl
IGxvY2F0ZWQgYXQgYW4gOC1ieXRlLWFsaWduZWQgYWRkcmVzcy4iCj4gICAgIGh0dHBzOi8vZ2l0
aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24vcmVsZWFzZXMv
ZG93bmxvYWQvdjAuNC9kZXZpY2V0cmVlLXNwZWNpZmljYXRpb24tdjAuNC5wZGYKPgo+IEZpeGVz
OiA3YzlhYWMwMDM5MjUgKCJyaXNjdjogR2VuZXJhdGUgRkRUIGF0IHJ1bnRpbWUgZm9yIEd1ZXN0
L1ZNIikKPiBBc3Npc3RlZC1ieTogQ2xhdWRlOmNsYXVkZS1vcHVzLTUtNQo+IFNpZ25lZC1vZmYt
Ynk6IE1pa2EgVGFtbWkgPG1pa2F0YW1taUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+
IEkgdXNlZCBDbGF1ZGUgT3B1cyA1LjUgdG8gdHJhY2sgZG93biB0aGUgZmFpbHVyZSwgd3JpdGUg
dGhpcyBwYXRjaAo+IGFuZCBpdHMgZGVzY3JpcHRpb24sIGFuZCBydW4gdGhlIHRlc3RzIGJlbG93
OyBJIGhhdmUgcmV2aWV3ZWQgdGhlCj4gcmVzdWx0Lgo+Cj4gVGVzdGVkIHdpdGggUUVNVSBydjMy
IGFuZCBydjY0IG1hY2hpbmVzIHdpdGggdGhlIEggZXh0ZW5zaW9uIGFzIEtWTQo+IGhvc3RzLCBy
dW5uaW5nIGEgZ3Vlc3Qgd2l0aCBsa3ZtIGJ1aWx0IHdpdGggR0NDIDE1LjMsIG11c2wgMS4yLjUg
YW5kCj4gbGliZmR0IDEuNy4yLiBXaXRob3V0IHRoaXMgcGF0Y2gsIGxrdm0gb24gcnYzMiBmYWls
cyB3aXRoIHRoZSBlcnJvcgo+IGFib3ZlOyB3aXRoIGl0LCB0aGUgZ3Vlc3QgYm9vdHMgb24gYm90
aC4gQnVpbGQtdGVzdGVkIGZvciB4ODZfNjQsCj4gYXJtNjQsIHJpc2N2NjQgYW5kIHBwYzY0bGUu
Cj4KPiAgYXJtNjQvZmR0LmMgICB8IDIgKy0KPiAgcG93ZXJwYy9rdm0uYyB8IDIgKy0KPiAgcmlz
Y3YvZmR0LmMgICB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJtNjQvZmR0LmMgYi9hcm02NC9mZHQuYwo+
IGluZGV4IDNjYmQzNmUuLmVjODNjYWEgMTAwNjQ0Cj4gLS0tIGEvYXJtNjQvZmR0LmMKPiArKysg
Yi9hcm02NC9mZHQuYwo+IEBAIC0xMTUsNyArMTE1LDcgQEAgc3RhdGljIHN0cnVjdCBwc2NpX2Zu
cyBwc2NpXzBfMl9hYXJjaDY0X2ZucyA9IHsKPiAgc3RhdGljIGludCBzZXR1cF9mZHQoc3RydWN0
IGt2bSAqa3ZtKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX2hlYWRlciAqZGV2X2hkcjsK
PiAtICAgICAgIHU4IHN0YWdpbmdfZmR0W0ZEVF9NQVhfU0laRV07Cj4gKyAgICAgICB1OCBzdGFn
aW5nX2ZkdFtGRFRfTUFYX1NJWkVdIF9fYXR0cmlidXRlX18oKGFsaWduZWQoOCkpKTsKPiAgICAg
ICAgIHU2NCByZXN2X21lbV9wcm9wLCBtZW1fcmVnX3Byb3BbXSA9IHsKPiAgICAgICAgICAgICAg
ICAgY3B1X3RvX2ZkdDY0KGt2bS0+YXJjaC5tZW1vcnlfZ3Vlc3Rfc3RhcnQpLAo+ICAgICAgICAg
ICAgICAgICBjcHVfdG9fZmR0NjQoa3ZtLT5yYW1fc2l6ZSksCj4gZGlmZiAtLWdpdCBhL3Bvd2Vy
cGMva3ZtLmMgYi9wb3dlcnBjL2t2bS5jCj4gaW5kZXggN2IwZDA2Ni4uZmIzNzRkZCAxMDA2NDQK
PiAtLS0gYS9wb3dlcnBjL2t2bS5jCj4gKysrIGIvcG93ZXJwYy9rdm0uYwo+IEBAIC0yOTYsNyAr
Mjk2LDcgQEAgc3RhdGljIGludCBzZXR1cF9mZHQoc3RydWN0IGt2bSAqa3ZtKQo+ICAgICAgICAg
ICAgICAgICAiaGNhbGwtc3BscGFyXDBoY2FsbC1idWxrXDBoY2FsbC1zZXQtbW9kZSI7Cj4gICAg
ICAgICBpbnQgICAgICAgICAgICAgaSwgajsKPiAgICAgICAgIGNoYXIgICAgICAgICAgICBjcHVf
bmFtZVszMF07Cj4gLSAgICAgICB1OCAgICAgICAgICAgICAgc3RhZ2luZ19mZHRbRkRUX01BWF9T
SVpFXTsKPiArICAgICAgIHU4ICAgICAgICAgICAgICBzdGFnaW5nX2ZkdFtGRFRfTUFYX1NJWkVd
IF9fYXR0cmlidXRlX18oKGFsaWduZWQoOCkpKTsKPiAgICAgICAgIHN0cnVjdCBjcHVfaW5mbyAq
Y3B1X2luZm8gPSBmaW5kX2NwdV9pbmZvKGt2bSk7Cj4gICAgICAgICBzdHJ1Y3QgZmR0X3Byb3Ag
c2VnbWVudF9wYWdlX3NpemVzOwo+ICAgICAgICAgdTMyIHNlZ21lbnRfc2l6ZXNfMVRbXSA9IHtj
cHVfdG9fYmUzMigweDFjKSwgY3B1X3RvX2JlMzIoMHgyOCksIDB4ZmZmZmZmZmYsIDB4ZmZmZmZm
ZmZ9Owo+IGRpZmYgLS1naXQgYS9yaXNjdi9mZHQuYyBiL3Jpc2N2L2ZkdC5jCj4gaW5kZXggMWVi
NDVmYy4uNGEyYzQ1NiAxMDA2NDQKPiAtLS0gYS9yaXNjdi9mZHQuYwo+ICsrKyBiL3Jpc2N2L2Zk
dC5jCj4gQEAgLTM0MSw3ICszNDEsNyBAQCBzdGF0aWMgdm9pZCBnZW5lcmF0ZV9jcHVfbm9kZXMo
dm9pZCAqZmR0LCBzdHJ1Y3Qga3ZtICprdm0pCj4gIHN0YXRpYyBpbnQgc2V0dXBfZmR0KHN0cnVj
dCBrdm0gKmt2bSkKPiAgewo+ICAgICAgICAgc3RydWN0IGRldmljZV9oZWFkZXIgKmRldl9oZHI7
Cj4gLSAgICAgICB1OCBzdGFnaW5nX2ZkdFtGRFRfTUFYX1NJWkVdOwo+ICsgICAgICAgdTggc3Rh
Z2luZ19mZHRbRkRUX01BWF9TSVpFXSBfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDgpKSk7Cj4gICAg
ICAgICB1NjQgbWVtX3JlZ19wcm9wW10gICAgICA9IHsKPiAgICAgICAgICAgICAgICAgY3B1X3Rv
X2ZkdDY0KGt2bS0+YXJjaC5tZW1vcnlfZ3Vlc3Rfc3RhcnQpLAo+ICAgICAgICAgICAgICAgICBj
cHVfdG9fZmR0NjQoa3ZtLT5yYW1fc2l6ZSksCj4gLS0KPiAyLjU0LjAgKEFwcGxlIEdpdC0xNTcp
Cj4KPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlz
Y3YK
