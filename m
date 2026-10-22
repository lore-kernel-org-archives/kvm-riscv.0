Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1BE606A31A
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 13:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=11c2gkFA;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LUPz9l+K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5vbtVUAGjYeP0JgaMODHu1sZDkozKKjPD+KJ0Zi3260=; b=11c2gkFAcZU8t3AeVZ6ouHDs2c
	UX3MhQy3A3Y9SGWDkLjCRUSOiPbs4Kq+6pGqatIiylOX0OsP4CKSoy9YIemsG/50Ad6i8aa7w4Ffl
	b5cpZJ2LeZvy2jp8pstdPtRcuX9/4eUGWkKuOj+y9yuWazcV/KtqSR1nZ5AMxP+vUDj8Su02Tk+hF
	1EXtbpsvhO6dXAtK+NXdbvaR2aPL99ZQCbL50da8gw6IUNIHnrLn9/JornZ5NEozH0mx2zfe9j8db
	dhaZzxs3Z3H638lKhUAwWdSAhw+3CkXPxjK/BBmGiKFmNSvg8kHKKjnVAJwsZnUdKwlcLUns66LmN
	dmRHzemQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsUt-0000000E8bf-1WQ7;
	Thu, 22 Oct 2026 13:06:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsUq-0000000E8b0-2Adu
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 13:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792674374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dxaVeA9dwlfGvtK81Fy9yy2UTm6OUnIBULBY7N9vAQU=;
	b=LUPz9l+KiJfztowNSTdpbuIf1sEo0b62puHOfHUuQHyDemT4MBYisEfl7k1pCBU/J3nj0X
	HHFfOAom+NxjsNXW1iozgvg1CbaZNZ3o+ZnlaiS2PcqTxYQmi3knYnZhAxlafiXwVIj5QV
	ocXlojKk+IncMERyMoVwzi5sPZsKego=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-MW6bz7w1NPe5NP2-y5ItMg-1; Thu, 22 Oct 2026 13:06:12 +0000
X-MC-Unique: MW6bz7w1NPe5NP2-y5ItMg-1
X-Mimecast-MFC-AGG-ID: MW6bz7w1NPe5NP2-y5ItMg_1792674371
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so1699121f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 06:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674371; x=1793279171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxaVeA9dwlfGvtK81Fy9yy2UTm6OUnIBULBY7N9vAQU=;
        b=mi6iIhgK+/X6zhllaZkluJamht55ONsbbjHg5TA2qlwCN8NBFv8IMwhpevbYDqiVn9
         jFp791wAjQFDl0kohej5ixw1l7dp04lkhjMzTShHrg26CpgCjtsy24URSVRHYIFAGx+i
         uQDx+aYRMDw8kl6IdtLXX7oEjzrMZa47BP9xfW05Qg7qrXCuXLKBndPT5K584EYesqRK
         7pdzQfkqPQvMio36+PSC5nBXLwlahixMDJlO9vgvjqVKpIEe8cdylxOq4nzmQiPGLqSu
         Ix+6SNeJGPB5HwQrVhUDv3qRv4clu5YGQ9pgHE7T+g77yVBYNfw7j+U7yaqlPVYTL2Ym
         TUdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTv/fYHy/AvChmg0SZLP1S4m3A1XIFfVu285pir7XHERdRB6dakjOOuscJ5Nn1dnZQZYLvuFcN8yI=@lists.infradead.org
X-Gm-Message-State: AFq9FYI3bj/puvaU9v31DJFLSaNVKgKPHSWgfsCbExlVXrpL+XTrACOq
	PPn00GMc9so7naLlTmgOuigeQjIvJWSEX/AjUvo72pah8NjLxUrdV9mZj81UVevY4N3VPdW6aEK
	9eMlbOscGTq+LDNZfqP4R1ngJxlmz1hYyJjKn7GzlGoPv5qf9v1KE/uGDsAlosjUr/ugN6yf8WC
	c7FAKOJ8U0ADOs7vQhNAy8DkPdxyqWvDpBcaUJMAQJgA==
X-Gm-Gg: AYBFou3IgOBpEVGYLRPDfpRCB8T66jzA30i6J6ZvQCnNyFT6jqeTGTQ+V46M+dKKuWt
	BgjhfRI2zKO4ufcqyvlbXwlPJZH+EwMSekI0neN3XowL2mEupUDI1KEEMIyyj3Elr+vdg7lpvWd
	zRyI9CTF0lt1cN18oBD5sbX1eOBTXC2NTOBoQySfXjHQRf05DIPClVCSEd5kI6elO7PP5Q1Mapz
	qVzVlkEdwHOUcYnRb30x0ZCEDQQ/OTb49578FeVM1pqrOvUZB9sl8+Uup5nDw==
X-Received: by 2002:a5d:6f04:0:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e264e5a1amr10387232f8f.47.1792674371373;
        Thu, 22 Oct 2026 06:06:11 -0700 (PDT)
X-Received: by 2002:a5d:6f04:0:b0:48a:fb1c:c2a1 with SMTP id
 ffacd0b85a97d-48e264e5a1amr10387172f8f.47.1792674370977; Thu, 22 Oct 2026
 06:06:10 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
In-Reply-To: <CAAhSdy1zNA7Xn9Uv1fFTRJMuCP0Pd2xLQazzm2FedTo_DZwMCA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 22 Oct 2026 15:05:58 +0200
X-Gm-Features: AclHuK_RpyhykSoyERIoG3foVlRnMgmZP9P6H-hF9JVROR7Ewx-6kuXhcSsJSlg
Message-ID: <CABgObfaH4-Ud4VR=GC8giDmWGJWS-tvYSmPOs4TtWg2hm4ocqw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 7.4
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ivN09XJxvByXFyJr7CrIzSOMaFv4fECrCf7Q3M4BxWU_1792674371
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_060616_646157_7B8A957B 
X-CRM114-Status: GOOD (  12.20  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgMjo1MeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBJIHdhcyBvbiB2YWNhdGlvbiBsYXN0
IHdlZWs7IGhlbmNlLCBJIGFtIHNlbmRpbmcKPiB0aGUgS1ZNIFJJU0MtViA3LjQgUFIgYSBiaXQg
bGF0ZS4gQXBvbG9naWVzIGZvcgo+IHRoZSBpbmNvbnZlbmllbmNlLgoKVGhlIHByb2JsZW0gaXMg
bm90IHRoZSBQUiwgaXQncyB0aGF0ICpub25lKiBvZiB0aGVzZSBjaGFuZ2VzIHdlcmUgaW4KbGlu
dXgtbmV4dCB1bnRpbCB5ZXN0ZXJkYXkuICBUaGlzIGlzIG5vdCB0aGUgZmlyc3QgdGltZSB0aGF0
IEkgbm90aWNlCnRoaXMgYW5kIHJlbWluZCB5b3Ugb2YgaXQuLi4KClRoZXNlIGFyZSA4MCUgYnVn
Zml4ZXMgb3Igb3RoZXJ3aXNlIG5vdCBuZXcgZmVhdHVyZXMgKGUuZy4gMy80LzUvNiBpbgp0aGUg
bGlzdCBiZWxvdyB3b3VsZCBiZSBmaW5lIGV2ZW4gZm9yIC1yY04pLCBzbyBJJ2xsIHB1bGwKbmV2
ZXJ0aGVsZXNzLiBCdXQgKnBsZWFzZSogdHJ5IHRvIGNvbW1pdCBzdHVmZiBhcyBzb29uIGFzIGl0
J3MgcmVhZHkhCgpQYW9sbwoKPgo+IFdlIGhhdmUgdGhlIGZvbGxvd2luZyBLVk0gUklTQy1WIGNo
YW5nZXMgZm9yIDcuNDoKPiAxKSBMYXp5IFYtZXh0ZW5zaW9uIGVuYWJsZW1lbnQgZm9yIEtWTSBz
ZWxmdGVzdHMKPiAyKSBJbXBsZW1lbnQgS1ZNX1BSRV9GQVVMVF9NRU1PUlkgaW9jdGwoKSBhbmQg
ZW5hYmxlIGNvcnJlc3BvbmRpbmcgS1ZNIHNlbGZ0ZXN0cwo+IDMpIFNob3cgc2VwYy9zY2F1c2Uv
c3R2YWwgQ1NScyBpbiBLVk0gc2VsZnRlc3RzIHZjcHUgZHVtcAo+IDQpIFVzZSBhIHJhdyBsb2Nr
IGZvciBJTVNJQyB3YWtldXAgc3RhdGUKPiA1KSBSZWplY3QgdkNQVSBjcmVhdGlvbiBhZnRlciBB
SUEgaW5pdGlhbGl6YXRpb24KPiA2KSBVcGRhdGVkIG5leHQgYnJhbmNoIG5hbWUgaW4gS1ZNL3Jp
c2N2IE1BSU5UQUlORVJTIGVudHJ5Cj4gNykgQWxsb3cgWmljY2xzbSwgWmljY2Ftb2EsIFppY2Np
ZiwgWmE2NHJzIGZvciBLVk0gZ3Vlc3QKPgo+IEluIGFkZGl0aW9uIHRvIHRoZSBhYm92ZSwgd2Ug
YWxzbyBoYXZlIHRoZSBmb2xsb3dpbmcgZml4ZXMKPiBhbmQgbWlub3IgaW1wcm92ZW1lbnRzOgo+
IDEpIEF2b2lkIHJlZHVuZGFudCBpbnRlcnJ1cHQgY2hlY2sgZm9yIHBlbmRpbmcgdGltZXJzCj4g
MikgRml4IGJ1aWxkIHdpdGggdmVjdG9yIHN1cHBvcnQgZGlzYWJsZWQKPiAzKSBGaXggSVBJIGRl
bGl2ZXJ5IGZvciBvdXQtb2Ytb3JkZXIgdmNwdV9pZAo+IDQpIFJlcGxhY2UgaW1zaWMgc3dpdGNo
LWNhc2UgbWFjcm9zIHdpdGggcmFuZ2UgY2hlY2tzCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxp
c3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
