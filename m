Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41B606A319
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q7haxbxI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=XYj1CN5K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+iVC08wT93v9u+o+9Z60bRS4QA/HOt3t/klunjajCY=; b=Q7haxbxIZvor9o
	qc+1o3c5D300e9ATP/6h/NaOCzYRRES5IEOLRZH3Cd/d4362MqAJOwerys6hyPf2rhBsg6yUcHVN1
	PHIh0+DvJ+XFhH7T3LhqdhMHWEdXyFSeTn3zNcdDnqLgQiwxEBmpteEEpkWWIfqNZDtykCsUi836r
	lMFuH/AV0UHPachjJNNbssI8xIyq7b4vZRyh27553f+B8fTOUQgxfoIuOPJ+bpzzpS+v5UvkMItsq
	VDM7dHKRp5ZalXXErs2BW7n5ZAal/iANFhmmVEukjA+iY9lPLqvdPgJlPOZqz39SCtcYGxKK6HjYe
	zhc1/J0m4ZwIq4u/KKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmHJ-0000000DSv6-1Du4;
	Thu, 22 Oct 2026 06:27:53 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJmHH-0000000DSu2-06k0
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 06:27:52 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so13129561fa.0
        for <kvm-riscv@lists.infradead.org>; Wed, 21 Oct 2026 23:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792650468; cv=none;
        d=google.com; s=arc-20260327;
        b=j26nYWtCTOlJnO6atMAl9udIxvsVdMNJmgCrgV+SXD3B7hcnIcIu60IEac0hx4H1mX
         6E3wCb77oz/oGbggOMxrpUBaLsEknfWOYeq9ZIqAMxuch0ugtO0rCd4eRt/uNScBfuyy
         YawAAKc/VzwPj15nTDQqhZgo3fVZFJQhZa5dfs3jR5KNzd6i9Ql9Fj3ctZO74uClqjm/
         hVL6tEARUuLN9baunhHb/T/15CWtsGojwvt6D0+SraKF7VrcKBa32LsjLxSjmlKoMEnV
         qdUAggcVGu1pOoIdAg+l7/URNlUllKjKJxVwnMBNutE/BxccPYpsv7vn+TC7HpF4kW4Z
         d5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        fh=yHLM4IaWxoMBe5NJH0Dm2VHAJ+6BOoA5Y7r6KQcMuwA=;
        b=B/wzZk5yZkPXPLkepnnlu1jSPR0AMS9K6jpQQSyNYOZI2TPg4Yujnt5igmgXZXlTmo
         UpsujsZVWgW6YiQi5lfH5HpiuxsZg2eb58+//HwHV6FXjho2uXk9SpGt9QDDgvdCIpVv
         wG3picnNig/r/MeVKiQQOEd6S+myXynBBg3xaKj8qLvOx9ohx7BCtutdp9UL7vKQUeEa
         iLQ5yGKHoHN0bIMvdPFcptE7rESdlW8D16oa/zH+qYuHj97zPZbtwQcFXHVu6u3DdMQP
         5dJPOo6eu22v/CcTXE5x6U2Xd9zf0o72rCywk+zabciYNk2Ig93oXkxynHhHDeuLSnVF
         7Smg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792650468; x=1793255268; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=XYj1CN5KXzj8KniwrQniokByk/OCVNkIWwhXHk/EpAcSu+prGerW5mK2aDXMtvMPst
         SCKP4DVWDpi4q06K3Z5vgPRZ/rcxrI1kxQDSMkmXjlbWCpk+7p+XUJoxB8FC8J261nHW
         x70i9IHJTVtAby0B37yMlA1M6AofPUPYgGc92Lsx5IGwmfrjExzmAeYydB22OejMmRLt
         ndU/SAQVddXmXT9j7S+PSH/D9JIIj4IPFnN3MQdfcFsArgZuOOqphr2LnWRE4s74WkXC
         DL00pEatmKuUR79IZ3VtZ5VHVYjI5iLchzUSxpD2t8mtRqjRh5uWwMjnlERWR1Of7tUs
         83TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792650468; x=1793255268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8KWIoZNW6/QAD3FZ28O4CFbS3YPAHolywa/ZQAktrE=;
        b=20qkoCxhP5kzlJ58T9krsTzq3r0tuwUNwPYw5gVQuS+LfVZfA1oZNWSLkXrY/Fu4AJ
         dhXrcMoh06IWKgly7Zyq/LMTN9p5/4eZc8oNhGWe+JQ1Xho2kQjjobrl4u/MqRdIY161
         aq22HEYHjtaqwUP+ShmnmWkyVC/xxfkjhQr1D4yHbPlBqR/tgXQglggRBkS4rjwoIiky
         D4UCx+2l33TbXlQuEN4UubKbtVVAd4mllZP0uN6liZkryH4UGW1BTr+VtVUry/WQErdq
         21tQPfuKT2n4ML6KmqNG0wIqbsvsOF6lNAW340O6HjD7raXvHtA4U1oYsbb+FKD3tRgE
         xSDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFAY9yK4R9TaMNdWEzEPGnrG1onjp7rgMYP54qwJxBfRcR01RKm9FNpmgmF3ofxTjC1WAqfbwDFJA=@lists.infradead.org
X-Gm-Message-State: AFq9FYKuCQVLQRmjYgz9C/HCnOv1D25q/5tx5aBCvKyHxbcbXuYV0uW5
	ZO719Z6ckFVtv6SNtEiuUjI9aQVf4vXgJWHbrWDYaWAnsMke1krVHJ/yMvfwL6HbXJP9zy14hxq
	KVFsJefSUML4mL8XbQ2R0WM2eNmkvQf2CRV434DKQEw==
X-Gm-Gg: AYBFou2lipNL53gSm2KjkcdlWRyaDPVct6eCms2+QApb7kFcBTMn16YbVPH7IbvOeKw
	fknWWFjwxt7JeaDTKv87BQtyb7IIuwIRawVoXpuNvMrtNt6H6ul5GS7AxAB1nX4DX18vCiGIVEQ
	Jb0+/WdPiye8O1EkGmiIynOmMOZwLXlbTXQiUJv5TlvW2XXmbEJBOq1M95j69F4l5yZyce4nSrl
	lskbXzwRypB+Qm/H/svqRF49JieJRPCH3GW0lLb3Kv6H0jqaK9cSGNOtt5Ww4K+/2mTjrLmsCyX
	u6Y7s2BAOKfwk/XpQO4zEuiyZoGcN6Tu/GR0+qtNywZw6qlT59HpLzI2Z/SvKYnUA5F/q/IXHn+
	BELikOQSYMNvlsxWveS3W+0dTGNzK+hFcjMEERMS6W8CzRWKBxeg5qcgt6SBxWO1hfitcTCqVbk
	0TrwuQ9h69O1jbeKa8/J8PKt8CgU8Enbl2a9A8eXbcezlYjBINkSycqQjH4BCpHFZA0kdIU7FTb
	KV2qw==
X-Received: by 2002:a05:651c:3134:b0:3a9:9a3b:6036 with SMTP id
 38308e7fff4ca-3ac440b53c8mr12628651fa.2.1792650468375; Wed, 21 Oct 2026
 23:27:48 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
In-Reply-To: <20261014224239.963635-1-heinrich.schuchardt@canonical.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2026 11:57:36 +0530
X-Gm-Features: AclHuK-9TFsRegjYZcIPEHWDYDOWlB5NKzsnn-yH7Qq40hb2qm3j1NzJo9FfRwI
Message-ID: <CAAhSdy39UtV0sUqL0=FX+HWa7oAH0fkei1cFKiF6OBSSFT=gdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] RISC-V: KVM: Allow Zicclsm, Ziccamoa, Ziccif, Za64rs
 in guest
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Sarah Emery <sarah.emery@canonical.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_232751_086245_B5A5CDDA 
X-CRM114-Status: GOOD (  11.94  )
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

T24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNDoxMuKAr0FNIEhlaW5yaWNoIFNjaHVjaGFyZHQKPGhl
aW5yaWNoLnNjaHVjaGFyZHRAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgdGhlIEtW
TSBJU0EgZXh0ZW5zaW9uIGFycmF5IHRvIGFsbG93IEtWTSB1c2Vyc3BhY2UgdG8KPiBkZXRlY3Qg
WmljY2xzbSwgWmljY2Ftb2EsIFppY2NpZiwgWmE2NHJzLgo+Cj4gVGhpcyBpcyBqdXN0IG5vdGlm
eWluZyBvZiBoYXJkd2FyZSBwcm92aWRlZCBjYXBhYmlsaXRpZXMuCj4gTm8gS1ZNIHNwZWNpZmlj
IHN1cHBvcnQgaXMgbmVlZGVkLgo+Cj4gQWRkIHRoZSBleHRlbnNpb25zIHRvIHRoZSBnZXQtcmVn
LWxpc3QgdGVzdC4KPgo+IEhlaW5yaWNoIFNjaHVjaGFyZHQgKDIpOgo+ICAgUklTQy1WOiBLVk06
IEFsbG93IFppY2Nsc20sIFppY2NhbW9hLCBaaWNjaWYsIFphNjRycyBpbiBndWVzdAo+ICAgS1ZN
OiByaXNjdjogc2VsZnRlc3Q6IGFkZCBaaWNjbHNtLCBaaWNjYW1vYSwgWmljY2lmLCBaYTY0cnMK
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1
ZXVlZCB0aGlzIHNlcmllcyBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCj4KPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgICAgIHwgIDQgKysrKwo+ICBh
cmNoL3Jpc2N2L2t2bS9pc2EuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysr
KysrKwo+ICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMg
fCAxNiArKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygr
KQo+Cj4gLS0KPiAyLjU1LjAKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
