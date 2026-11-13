Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4AA606A327
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XPkaMGw/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=Wtzw1xME
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WmO0PAgyvDzzyxkTtV6umvxWnwnc+ntDWUlLRePv6Fc=; b=XPkaMGw/JUVSUqJIS03vbjW2MD
	gEBDMQdlvXsZe9e7sy+ZG1OkWPIr7ENA4GBdiCHWHEdbkFxfPV015+ypRLLWXkVjgOww4WmeYobEF
	/XGVioYRF16T5MFVCTtycJYdebYHemPBx5Wp3XRLq6A5YEMjVND+wT4/sxdifo93uULXEoA0FIY0E
	G9GKLb2MLI2PM66UalRF4gqRsUhhkDaXak1y1VolKxeJ3XT02UPHXj/KXMV0rgCZdXOKEsLuXz6fv
	yedZZQ3lgPlhGoTe3eOZCseX54rj8WqbAN8vpxGnBsNhosFvt69gJu+C5J+KyxXOz4Ds/pmqP/Vpt
	26BisDlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpVI-0000000CXpP-28oK;
	Fri, 13 Nov 2026 11:31:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpVB-0000000CXoD-1Jko
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:31:32 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso14747915e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Nov 2026 03:31:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794569487; cv=none;
        d=google.com; s=arc-20260327;
        b=MMxLFdcymIwqBbvPm5ELT7kii19IgrjirvyerRxwVoMhZzB4h9alZRUoGp9srmT4XY
         VBp4hllDBIOMgcm1N+gLQO2KLayRolcablXnmLSKxHduYoMKtq5kOhii9v9dw0CWCbnG
         zijC1SWbQqeYuuvBisugi3jQMzBVq+FYDvMj6vh1GaLEzVPJoq8UFNJmAquHrgXUhAoA
         z18PcDooJa+MkMBVOPabtiUp0HuY2tRTg6d3gu/bQ1/CvS/F3/+cNZUYWCdLoPiYn+JA
         sOeAaXedvQ96BZAK11EiyOvLuwqoMz0xu6J0Yy2M3lniK1hs19d/YJCScvXirj9lLkVV
         /PIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        fh=TmJcQcDty1KTwN4K+NmFI1HlEpoESxadBFbNS1z1fgI=;
        b=nzL0mDrvKhNg1npHHXqaHbsknT5fxk6VwogGcwG2knpOugRBk4RMMN7+ROjfMg1jft
         pjWPAhvkUZX9EeCQqzkMncUopuS0AYanRMCY6wBqAg6QKXWEQpFDJ8nFujU2NDcDETZ0
         MBOIj0Lk/n8bP+oMWnCzBaNy76OpU4ZEFRvpopTsvSfhHAEAFiShNycF8bh1RiCavoIM
         2yspav6fPp3i2nKqI8S6PlcOnKwPMgEvlxFx2rLvsNMuQPy57fSJNCi5WM036UyRoT5c
         w0Bb8IZf7T5EbtyJMY4mWHsSSCiNK/PwXMt3niyCHRBfTRYRKCFpnNMPeZjqV/y+L746
         QDMw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794569487; x=1795174287; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        b=Wtzw1xMEHRvoZqRmdg3x8JOrps/WLj4grOTK9YvN62hNwmRldRHAKhF1blrJczcfXk
         nl3HhVM/KrOWK6JLFws3dpgyavLc/JclnQWSiKFb8/rjkBKXJCLt4Qn26yq8DHF+th18
         tHHZVFFTM4ReyCZAP12uQ5nlOqsLehYnc5mSbp+AirWS8kUqwogDuEdpeUON9vIFFsMR
         dP6m2QO3gnsckhjuxCkDn1XTAMuaOttRqamJQD28ohdQiBp6VIVxCloQWYEHZsW4nJJI
         fRFkYwaFQDnBNzkOwocpR8w9ojEtT+BAjAjMsg30BYxhqMxCogS2pJ3f626ZhnNosiGQ
         KXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569487; x=1795174287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MW//+eO8ifeDOMCGO0P1S62YlRWi+XpqU3MxHUVvu60=;
        b=ow83rwY/71+eMlNmhAuysPIQ/f8S/sdcd0+Ulx27QL4oaYH0745Lk3uToHFtb0az2E
         tdUWhjU4MJ/3LTU3fH9GPNr0jJtBIpRfn2EINTvFRCWdqJdUkSxd8gfv8YfIG1qJnXUS
         a0Jy3zxR3xVASSxFsm/07qOVgV+C3YBeGGS70krbWm43yZ07lR3tUP7hlr1mjnRCwZY/
         uTWPL500Yo3yoHurXlnMRMdx7Pp8RlIvW7PIVx/aXBqmm97XYr2y6ilfz/nCvdJh41HE
         dBKC42G33yizaxKSNY05JVeoU+0UbTjTfMvihm85s5S8g5nj0Fw2FJBSbV0iI41vKklO
         qC3g==
X-Forwarded-Encrypted: i=1; AL+hErEvUeVsSGbViwQnl4rfzkMH9a/0Lvovn366hgpiFJMBMwRHHrvEzbOfQViB17i4TVFe4ieNNHYMTZc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/V1Md9/gS2nAC4Syb14mNqO6Odga1tlXN8R4YItuic6NYzOBTs
	WwTUDksiEMfw8CEIWZsB3qAEE7QE724Tpz47xw4Nkz786kdualtvlrC5ouWPEOvppqomjU50gOj
	DqGi10Qh9ld8DRIi/tacyuKLV6FwlZwnbLiU+AF+q5Q==
X-Gm-Gg: AYBFou2istkgjeEOkdA8FEgexcub8LPyTRFTYwTAQH5947N/lx+Y0mQkFglCrzIVLr3
	tn/7rzJrl7qsejyA23cS3IuINYtngCqyfNVEY0aaGKQ14Sc5IbS7kb9VL3Ku5iLWjknx+0Mwrou
	ZsNOumNwB6U8gY0M/DTT8XL5AQ7MosyK9Vt/Z2uuZ6WVStB5aPpC8TYBRWp0CaPn7C5fwDt5ild
	6HkfnbItIlwNuH079A/PsunmtDqnmbOxqfgIONu8NFXTGcu5lRAGa81f84prg8NqqrMnod/lq7i
	UysLxfJqNlgKMsxilo9Cgu4TlEwy9KJwruI2whk8S8FJwWVw426vBJlWsGGFUKFWhkzFB6AVbc9
	VZHzL7tJJZnCsEyo++LHAvCOyduS+N8SfE6mj0B6bR1XX+egve7U6wtxusknq8wiypKOHGXD9/i
	9yUNSdYJfOmbDVWVew03GqbEuL9YBUVmodW09qQFF+pYBGovxoC/mHMeM=
X-Received: by 2002:a05:600c:8b55:b0:4a2:a3b:7aa8 with SMTP id
 5b1f17b1804b1-4bb55a02927mr44985235e9.3.1794569486922; Fri, 13 Nov 2026
 03:31:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261016101458.221648-1-suunj1331@gmail.com>
In-Reply-To: <20261016101458.221648-1-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 17:01:15 +0530
X-Gm-Features: AclHuK90R6Cy2P8s5V5asYEwdHQCx6nGX6JWvDYYKndKeaNm5EjrRpe8coA3QcE
Message-ID: <CAAhSdy2KUD5xXFeKY0OD=iUzQzRHW87KjCamPQxcdxK-riq9FA@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: Set Accessed bit in dirty-log write fault
 fast path
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: atish.patra@linux.dev, tjytimi@163.com, inochiama@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	andrew.jones@linux.dev, pbonzini@redhat.com, seanjc@google.com, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_033131_429022_DCAAF785 
X-CRM114-Status: GOOD (  21.30  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMTYsIDIwMjYgYXQgMzo0NeKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4ga3ZtX3Jpc2N2X21tdV9kaXJ0eV9sb2dfd3JpdGVfZmF1
bHRfZmFzdCgpIGNvbnNpZGVycyBhIGxlYWYgd2l0aCBXCj4gYW5kIEQgc2V0IGFscmVhZHkgaGFu
ZGxlZCwgZXZlbiBpZiBhZ2luZyBoYXMgY2xlYXJlZCBpdHMgQSBiaXQuCj4gT24gaGFyZHdhcmUg
dGhhdCBmYXVsdHMgd2hlbiBBIGlzIGNsZWFyLCB0aGUgZmFzdCBwYXRoIHJldHVybnMKPiB0cnVl
IHdpdGhvdXQgc2V0dGluZyBBIGFuZCBza2lwcyB0aGUgc2xvdyBwYXRoIHRoYXQgd291bGQgc2V0
IGl0Lgo+IFRoZSBndWVzdCByZXRyaWVzIHRoZSBzYW1lIHN0b3JlLCBidXQgQSBpcyBzdGlsbCBj
bGVhciwgc28gaXQKPiBmYXVsdHMgYWdhaW4uIFRoaXMgcmVwZWF0cyBpbmRlZmluaXRlbHksIHBy
ZXZlbnRpbmcgdGhlIGd1ZXN0Cj4gZnJvbSBtYWtpbmcgcHJvZ3Jlc3MuCj4KPiBIb3N0IHJlY2xh
aW0gb3IgcGFnZV9pZGxlIGNhbiB0cmlnZ2VyIHRoaXMgd2hpbGUgZGlydHkgbG9nZ2luZyBpcwo+
IGVuYWJsZWQsIHBvdGVudGlhbGx5IGhhbmdpbmcgdkNQVXMgZHVyaW5nIGxpdmUgbWlncmF0aW9u
Lgo+Cj4gUmVxdWlyZSBfUEFHRV9BQ0NFU1NFRCBpbiBhZGRpdGlvbiB0byBXIGFuZCBEIGJlZm9y
ZSB0cmVhdGluZyB0aGUKPiBmYXVsdCBhcyBoYW5kbGVkLCBhbmQgc2V0IEEgYWxvbmcgd2l0aCBX
IGFuZCBELiBUaGUgZXhpc3RpbmcKPiBjbXB4Y2hnIGxvb3AgcmV0cmllcyBpZiBhZ2luZyBjaGFu
Z2VzIHRoZSBQVEUgYmVmb3JlIHRoZSB1cGRhdGUuCj4KPiBGaXhlczogNzcwNWJlNTllYjJkICgi
S1ZNOiByaXNjdjogRmFzdC1wYXRoIGRpcnR5IGxvZ2dpbmcgd3JpdGUgZmF1bHRzIikKPiBDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZyAjIDcuMisKPiBTaWduZWQtb2ZmLWJ5OiBTZXVuZ0p1IENo
ZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgYSBmaXggZm9yIExp
bnV4LTcuNC1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiBUZXN0aW5nOgo+Cj4gT24gYSBIaUZp
dmUgUHJlbWllciBQNTUwIChFSUM3NzAwWCwgd2hpY2ggdHJhcHMgb24gY2xlYXIgQS9EIGJpdHMp
LAo+IHJ1bjoKPgo+IGRpcnR5X2xvZ19wZXJmX3Rlc3QgLXYgMyAtYiAyNTZNIC1pIDMKPgo+IFdo
aWxlIHRoZSB0ZXN0IHJ1bnMsIHJlcGVhdGVkbHkgbWFyayBhbGwgc3lzdGVtIFJBTSBpZGxlIHRo
cm91Z2gKPiAvc3lzL2tlcm5lbC9tbS9wYWdlX2lkbGUvYml0bWFwLgo+Cj4gQmVmb3JlIHRoZSBm
aXgsIHRoZSB0ZXN0IGRpZCBub3QgY29tcGxldGUgaXRzIGZpcnN0IGl0ZXJhdGlvbiBpbgo+IG92
ZXIgMTEgbWludXRlcywgd2l0aCBsb2NrX3N0YXQgc2hvd2luZyBhYm91dCAxNmsgcmVhZC1zaWRl
Cj4gbW11X2xvY2sgYWNxdWlzaXRpb25zIHBlciBzZWNvbmQgZnJvbSB0aGUgZmFzdCBwYXRoLgo+
Cj4gQWZ0ZXIgdGhlIGZpeCwgYWxsIHRocmVlIGl0ZXJhdGlvbnMgY29tcGxldGUsIGVhY2ggdGFr
aW5nIGFib3V0Cj4gMjkgc2Vjb25kcyB1bmRlciB0aGUgc2FtZSBhZ2luZyB3b3JrbG9hZC4KPgo+
ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyB8IDcgKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL21tdS5jIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiBpbmRleCA3OGExODI2YzQ2NmQuLjA0
MmQxZTNiMzU0NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL21tdS5jCj4gQEAgLTU5MSwxNCArNTkxLDE1IEBAIHN0YXRpYyBib29sIGt2
bV9yaXNjdl9tbXVfZGlydHlfbG9nX3dyaXRlX2ZhdWx0X2Zhc3Qoc3RydWN0IGt2bSAqa3ZtLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGRpcnR5X21hcmtlZCA9IHRydWU7Cj4gICAgICAgICAg
ICAgICAgIH0KPgo+IC0gICAgICAgICAgICAgICBpZiAoKHB0ZV92YWwob2xkX3B0ZSkgJiAoX1BB
R0VfV1JJVEUgfCBfUEFHRV9ESVJUWSkpID09Cj4gLSAgICAgICAgICAgICAgICAgICAoX1BBR0Vf
V1JJVEUgfCBfUEFHRV9ESVJUWSkpIHsKPiArICAgICAgICAgICAgICAgaWYgKChwdGVfdmFsKG9s
ZF9wdGUpICYKPiArICAgICAgICAgICAgICAgICAgICAoX1BBR0VfV1JJVEUgfCBfUEFHRV9ESVJU
WSB8IF9QQUdFX0FDQ0VTU0VEKSkgPT0KPiArICAgICAgICAgICAgICAgICAgIChfUEFHRV9XUklU
RSB8IF9QQUdFX0RJUlRZIHwgX1BBR0VfQUNDRVNTRUQpKSB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgbmV3X3B0ZSA9IG9sZF9wdGU7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
dHJ1ZTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgICAgICAgICAg
fQo+Cj4gLSAgICAgICAgICAgICAgIG5ld19wdGUgPSBwdGVfbWtkaXJ0eShwdGVfbWt3cml0ZV9u
b3ZtYShvbGRfcHRlKSk7Cj4gKyAgICAgICAgICAgICAgIG5ld19wdGUgPSBwdGVfbWt5b3VuZyhw
dGVfbWtkaXJ0eShwdGVfbWt3cml0ZV9ub3ZtYShvbGRfcHRlKSkpOwo+Cj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fcmlzY3ZfZ3N0YWdlX3RyeV91cGRhdGVfcHRlKCZnc3RhZ2UsIHB0ZXBfbGV2
ZWwsIGdwYSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHRlcCwgb2xkX3B0ZSwgbmV3X3B0ZSkpIHsKPiAtLQo+IDIuNTIuMAo+CgotLSAKa3Zt
LXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
