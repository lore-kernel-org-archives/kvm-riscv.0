Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F5A60A2601
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 16:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dG25lgx7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MzjCY2lj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HdLE15uoDssBmzThKBR0EATunJCXkwwz7UQQ+nopLwg=; b=dG25lgx7HtHavZgvj8oKVlJTS7
	rhBPwTYjB/iw0y/UUfL9B57ckF9hr8fwbQRrQ9lpyAwzVP8fSLISljGZVioJllV1XiN/U9xSlR8Zf
	J/tGkYr2hbdtxfIe20CsycoXNDle0fyAfqy2t0vcSMNICXC5AWxssge9QB/U4HzctM9f5K8URmbe6
	7hggKPXWZOAK25WoN2ur8ok97VUOaopoqgnroFvlG+XNKNiXZ7fzFvfo8u6l8DucXOe8/dhw5/ST/
	oaXHuK1wyR4nz6xLOHJmHkFF+IaDEshxbw6ybnItGKEcj9YKsiCWNRbVBYAh7UQ+deIOY2CLzAGcy
	3NKU0dsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURsy-0000000FbEu-0hW0;
	Fri, 20 Nov 2026 16:54:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xURsu-0000000FbDl-0oAp
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 16:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795193685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoK52sV9iYkRCVLGrLj4ttkVHmfRaxoQO9rnKusqNO0=;
	b=MzjCY2ljjBG3EF+eVvW3DJDiAOv7hYc7w65OjPluQCIholsa7/uTNh/83uztghop686Gf+
	jlU/xGwpyYLcBQEmbdSgj1nukVyvQBJpyBditgaKnpmuPdOrDCVerswH2LG1SDkgLQN0Fm
	QbH+Q7L5As/Wgq8CW4lBm9yGR5vm/RM=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-7_xp5vitPHyANQwxPAftsw-1; Fri, 20 Nov 2026 16:54:43 +0000
X-MC-Unique: 7_xp5vitPHyANQwxPAftsw-1
X-Mimecast-MFC-AGG-ID: 7_xp5vitPHyANQwxPAftsw_1795193682
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so788581a91.1
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Nov 2026 08:54:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795193682; x=1795798482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoK52sV9iYkRCVLGrLj4ttkVHmfRaxoQO9rnKusqNO0=;
        b=XwmoFaPehjJxFlKRchAOlrCRe+jBogY2vlqq94JVHUU7RK3FGxGvDX1NNai71iQ0GD
         tNyHxdJVX7kayL38TKluJkV5jU9CTAPf7EKD/KKfS7JbYkxzPG02Spl4JB1/cYN886oe
         aSv7swsaRTfARx3WCettRGBN53kFYNI+paoWn51ImJqIqBsk8nHlU4PtSzGOypUqElQk
         DQmPhjCBQDlkHAfHyBP8KXe0K24Tilt3zrTHudhOIET1y9W7HASfL5yHstqRFK7x6LQc
         U2i8Gqv1XVwYNKb9a3L3topwdOTwmrY0Q6+Cimt37y22rUMyOqLahCTbvv2v9DQWl5wl
         xZ9g==
X-Forwarded-Encrypted: i=1; AL+hErFXB0Nl0qLGtpEs/xpIytRLFHLhWwuZqOp9Sx423uqHdXKpuGjiLKAIUwKasK44PuUJTh+OMFVVtMU=@lists.infradead.org
X-Gm-Message-State: APuU4Z+ci1ihKgDGsPtt0ZL6ANP+OxA4Y0sRpLl9/Md15le+jJlfI5ya
	TMlw5rYEkB0ixViCTBxxcMgd2gQ0EKW9ctGe2BCIvsPKHcYzzo8906z2pqWyVfaOMLYeVSxGvVv
	JFSBIeh0rs6Nw9qBNBYA/FkHD7+KyUObyPkPf5zvZ/U0RJXvayoENXvTT0YMBg69mgbVgxWjQ4M
	QWGZAoPHgOwtMUa2Z0G9Qu+bt05MnTNRMHDowUrHfQBw==
X-Gm-Gg: AZFdTZfObMQyrFnGKo0B6Kc9oXWJ5PS5ZM3CorYErWlLQz71ogjcYlg+JBs79hOhxlV
	O6wKwK7lJ82TWjdAcMO7C2rYEJ9I2TWVlK1floTzcO5WpHICtsHVOwGPtYsz44AqZb1XhC2BcW4
	pay6NSygDpF+JBkbHC/jezjQC/qWbYcf3n1rciPEvPMAej3uWoz5mUD04eJ3IpQs1AEnfN3MeJE
	vkKpa5oCvsmVkNWHhRFWxjcQQ7PXksQJSFDjWFrrAyYbBcIzM5l1URw6l02iZAe9oJdzLT797ko
	kjURS2HRboHgmsc5MVBU
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b41c7bc5a5mr2651370a91.3.1795193681994;
        Fri, 20 Nov 2026 08:54:41 -0800 (PST)
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id
 98e67ed59e1d1-3b41c7bc5a5mr2651362a91.3.1795193681478; Fri, 20 Nov 2026
 08:54:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAAhSdy32nAjcz2vyN37Fb7nKc9jbUxWjUYjiYGda7NPhweJhTw@mail.gmail.com>
In-Reply-To: <CAAhSdy32nAjcz2vyN37Fb7nKc9jbUxWjUYjiYGda7NPhweJhTw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 20 Nov 2026 17:54:29 +0100
X-Gm-Features: AclHuK_cN9rwoorx-PqMlIeeT3j5FStKrFrMBtqWNaFqSpH_A-AQRm27GLu6w8M
Message-ID: <CABgObfaQNmyDgwRNdM7O5MbK=c-TB-GhAMzMR7ds_2oz0r9zwQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.4 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1RaRC8jbV6dNqz606ZbWy9KSNAHlWsSieoq-Ac0ZawA_1795193682
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_085448_447067_F838FACC 
X-CRM114-Status: GOOD (  14.79  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMjAsIDIwMjYgYXQgMTI6MjXigK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWlu
ZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xvLAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5n
IGZpeGVzIGZvciA3LjQga2VybmVsOgo+IDEpIFZhbGlkYXRlIEFJQSBNTUlPIGFkZHJlc3MgcmFu
Z2VzIGJlZm9yZSBBSUEgaXMgaW5pdGlhbGl6ZWQKPiAyKSBEaXNhbGxvdyBHUEEtd2lkdGggY2hh
bmdlcyBhZnRlciBBSUEgaXMgaW5pdGlhbGl6ZWQKPiAzKSBGaXggZG91YmxlIGZyZWUgb2YgdGhl
IHNwbGl0IHBhZ2UgY2FjaGUKPiA0KSBEbyBub3QgdG91Y2ggdGhlIGVudmNmZyBDU1JzIG9uIHRo
ZSBTaUZpdmUgUDU1MAo+ICAgICAoTm90ZTogU2lGaXZlIFA1NTAgaXMgYmFzZWQgb24gUHJpdiB2
MS4xMSBzbyBpdAo+ICAgICAgZG9lcyBub3QgaGF2ZSBlbnZjZmcgQ1NSIGhlbmNlIHRoaXMgZml4
KQo+IDUpIFNldCBBY2Nlc3NlZCBiaXQgaW4gZGlydHktbG9nIHdyaXRlIGZhdWx0IGZhc3QtcGF0
aAo+IDYpIFZhbGlkYXRlIFBNVSBjb3VudGVyIGluZm8gdXNpbmcgYXZhaWxhYmxlIGNvdW50ZXJz
Cj4gNykgRml4IEctc3RhZ2UgcGFnZSB0YWJsZSBtZW1vcnkgbGVhayBvbiBWTSBkZXN0cm95Cj4g
ICAgIChOb3RlOiBUaGlzIG9uZSB3YXMgYSBwcmV0dHkgZW1iYXJyYXNzaW5nIGlzc3VlCj4gICAg
ICB3aGljaCB3ZSB0b3RhbGx5IG1pc3NlZCBvdmVyIHRoZSB5ZWFycykKClB1bGxlZCwgdGhhbmtz
LgoKUGFvbG8KCj4KPiBQbGVhc2UgcHVsbC4KPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBhZWJiNzI3NDQ3NjQwMzA0MGQ1ODJjNjE0Nzhk
ZjhmNGE3YmY5Y2QzOgo+Cj4gICBMaW51eCA3LjQtcmMzICgyMDI2LTExLTE1IDE0OjMwOjExIC0w
ODAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0
dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXguZ2l0IHRhZ3Mva3ZtLXJpc2N2LWZpeGVz
LTcuNC0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZTliZjQ5YmJjNDIyNzA0
ODY4NWM3OGY5N2UxNDQ2ODQ1NzYwZGY0ZjoKPgo+ICAgUklTQy1WOiBLVk06IEZpeCBHLXN0YWdl
IHBhZ2UgdGFibGUgbWVtb3J5IGxlYWsgb24gVk0gZGVzdHJveQo+ICgyMDI2LTExLTE2IDE4OjA2
OjI1ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBmaXhlcyBmb3IgNy40LCB0YWtlICMx
Cj4KPiAtIFZhbGlkYXRlIEFJQSBNTUlPIGFkZHJlc3MgcmFuZ2VzIGJlZm9yZSBBSUEgaXMgaW5p
dGlhbGl6ZWQKPiAtIERpc2FsbG93IEdQQS13aWR0aCBjaGFuZ2VzIGFmdGVyIEFJQSBpcyBpbml0
aWFsaXplZAo+IC0gRml4IGRvdWJsZSBmcmVlIG9mIHRoZSBzcGxpdCBwYWdlIGNhY2hlCj4gLSBE
byBub3QgdG91Y2ggdGhlIGVudmNmZyBDU1JzIG9uIHRoZSBTaUZpdmUgUDU1MAo+IC0gU2V0IEFj
Y2Vzc2VkIGJpdCBpbiBkaXJ0eS1sb2cgd3JpdGUgZmF1bHQgZmFzdC1wYXRoCj4gLSBWYWxpZGF0
ZSBQTVUgY291bnRlciBpbmZvIHVzaW5nIGF2YWlsYWJsZSBjb3VudGVycwo+IC0gRml4IEctc3Rh
Z2UgcGFnZSB0YWJsZSBtZW1vcnkgbGVhayBvbiBWTSBkZXN0cm95Cj4KPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gRGF2
aWRsb2hyIEJ1ZXNvICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogRG8gbm90IHRvdWNoIHRoZSBl
bnZjZmcgQ1NScyBvbiB0aGUgU2lGaXZlIFA1NTAKPgo+IExpIEppbnl1ZSAoMSk6Cj4gICAgICAg
UklTQy1WOiBLVk06IEZpeCBkb3VibGUgZnJlZSBvZiB0aGUgc3BsaXQgcGFnZSBjYWNoZQo+Cj4g
UGVuZ3BlbmcgSG91ICgyKToKPiAgICAgICBSSVNDLVY6IEtWTTogVmFsaWRhdGUgQUlBIE1NSU8g
YWRkcmVzcyByYW5nZXMKPiAgICAgICBSSVNDLVY6IEtWTTogRGlzYWxsb3cgR1BBLXdpZHRoIGNo
YW5nZXMgYWZ0ZXIgQUlBIGluaXQKPgo+IFFpbmd3ZWkgSHUgKDEpOgo+ICAgICAgIFJJU0MtVjog
S1ZNOiBWYWxpZGF0ZSBQTVUgY291bnRlciBpbmZvIHVzaW5nIGF2YWlsYWJsZSBjb3VudGVycwo+
Cj4gU2V1bmdKdSBDaGVvbiAoMSk6Cj4gICAgICAgS1ZNOiByaXNjdjogU2V0IEFjY2Vzc2VkIGJp
dCBpbiBkaXJ0eS1sb2cgd3JpdGUgZmF1bHQgZmFzdCBwYXRoCj4KPiBZYW5neXUgQ2hlbiAoMSk6
Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBHLXN0YWdlIHBhZ2UgdGFibGUgbWVtb3J5IGxlYWsg
b24gVk0gZGVzdHJveQo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwg
IDIgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgfCAgMSArCj4gIGFy
Y2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYyAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAg
ICB8IDIyICsrKysrKysrKysrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAgICAgICAg
ICAgICAgIHwgIDkgKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAg
ICB8IDEyICsrKystLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICB8
ICA2ICsrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfY29uZmlnLmMgICAgICAgIHwgMTYgKysr
KysrKy0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgICAgICAgIHwgIDIgKy0K
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndmdC5jICAgICAgfCAyMCArKysrKysrKysrKy0t
LS0KPiAgYXJjaC9yaXNjdi9rdm0vdm0uYyAgICAgICAgICAgICAgICAgfCAgNSArKystCj4gIDEx
IGZpbGVzIGNoYW5nZWQsIDExOCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkKPgoKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
