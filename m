Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F86CD5BD5
	for <kvm-riscv@archiver.kernel.org>; Wed, 27 May 2026 05:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p7OVCh1fhFjtihbO0Q1e4pQPXqvwIJLia0vYdzpUvMU=; b=z/hwgV4ilYxg7F
	8IeFzLuYFtRT+bMflwBlM5z9XK08gbEfK0wVpKiyAZZY+ORlRjc9HqimHKX4PPqO84ChWhUom70aK
	V/QdL0gt7YPls7qH8xWUKZBPSOHpKN7rl05hPRslchzNSFfNNq7GpsOom7Ey5XJttcYdQ2DMlZnE3
	fn8D/0MnCQqveS9xo5EUsEi2a3LmpFybNqkLOLKAttlLPHPPCS80/GpRQLVStgh2PaPp/i4yK6aY7
	jt/MjZcxO4FB2v2NjbFTSWrZIN6C1q1KNQnuaLjq+lx1srZGuG2clbbB1TKhQzIDhWwTm/WefTLB4
	dkuVhhoLl4XcpuKJafjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CT-00000003Mkl-1Hin;
	Wed, 27 May 2026 05:53:05 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CQ-00000003Mip-3J3l
	for kvm-riscv@lists.infradead.org;
	Wed, 27 May 2026 05:53:03 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-3045c195251so4690166eec.1
        for <kvm-riscv@lists.infradead.org>; Tue, 26 May 2026 22:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779861180; x=1780465980; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mv8BPWe9vjiV7eG5zhSWNmlAlLaLwUax0FP44WMjBLo=;
        b=SeOWIfdssW2P6yWTXAoqoYH8neXCgdVbkHHFhVpqDZyKdi8O1K7m0ELZztnEYfxGV4
         0jPyWM9VeDOGG/b1GYXu+jcd4DE9plxnh0Aota8XIbZDDdduoIwqlhJhQBj2UMUo8PLF
         tEdP1S7qfgwUvb5Kvps6yTfhVIyFdQ+OtEBebAlvrEfFng4htsU9piVz776C5IpzbzX0
         Rt/Fi8AwdpDRF6GhLWFirIkFc+yoDzrOav+kCZuGXcvhNffr4azhiuZNF73+fO1R/IJt
         9dV076v3/+v0+WkLM4Hp2d6lfevE56w39tWDmXkmehtjDNA1lhjNTXzOOHdBJtH7M4SZ
         iYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861180; x=1780465980;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mv8BPWe9vjiV7eG5zhSWNmlAlLaLwUax0FP44WMjBLo=;
        b=lPOWKEdgkf/5pyMoQ8r8D6iqFzNCQSvRVZtpXBo1LwPrFMgVQR9nPiW7c4HBU6I+tQ
         X7EgWb95JvGcx5Pwt2XYjY76l6g45Vr7Gtjj0pAQCtDvkOA4XQ8Lcj2CB/Ty2x7bc5Jd
         YC3uFvKP+t+e5nlmiqNDbznx8Asl8m6I20O1Bluw1q32PrI3jeWqixF6o+jv15zv6ucP
         8C/QzywEwM232UHx1lRJmvQh9Ice1tvKAlU6U+dI93tEIA43H0z5NUOPjoRh9+2dUsv3
         s8pIc3mo41tT8LbPVdM6tUrhZ+bO7+q7JSmrl2lTUh2xv/aTNCpEUHOZVxPz/QPN1OGk
         wvtw==
X-Forwarded-Encrypted: i=1; AFNElJ/gFmyjgW7h4igCxZESkwHqXoY5CAaGKHgMZCHJHxQmo0u9wcz2OLkIN2H+CjyDvu3B2U/jNR51dQw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVgGlmvEr3A4LyDX/nAbUkFSh/Haf5zw22ABf795OMMUS50Vui
	q8GX9agHS7I1nb4AIyzhKvw2Aey9nWsGltjv1Hq5KiG/Ea9euvz+CQsKSeyFZUrKAg8=
X-Gm-Gg: Acq92OHWz3Ia1vsI2f2251f/Otlv2Kfq50KwKADcco6RI+FXsTuh/TKmJXf2jipOqGX
	YFUCm1YJUqJyhR8Hv9KBIMrF9vTPnqtDeujwwCkJ9Aq7XjTE58e5DbpzHtvNIc4uT8eB/6lU5ao
	Pp8DuC2iRZl0AoMa9B/TQR0IkJuvLdFR/P7QXIfxfDW0w6FnZMfEup8hphIl2O1EY8ZcVbGhxE6
	7Bt3zLNtNWUJjufonSWnKgy1O6vTTOcdLfz5K88JxiwwVT7L/VMR+Dl8ZZqWPzPeh0yX1aaYyGG
	wdawB0NKAjBEJ9xe9V2h/InW84NT6q0aUhJmWpaYE71E0GZR4T9KM20jqjRlXpsHqtBj9LYUEkW
	W3zUARTEh1FOBpzqNVbLuDVxldiDmLfMIIDHwZwXL03405aBpdO4zAVaIyewEe1bhE/k+vagQNH
	bfmX5/22VRMfcAgnxqWqYCrA49S5sXqtBVvuiJ9iF6c1Xs1LedjptbHb1G6OPfWMHk
X-Received: by 2002:a05:7300:ef82:b0:304:b93a:511a with SMTP id 5a478bee46e88-304b93a555emr669520eec.28.1779861180303;
        Tue, 26 May 2026 22:53:00 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304be0851c9sm613202eec.23.2026.05.26.22.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:52:59 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 0/3] KVM: riscv: add check_supported_reg() into
 get-reg-list test
Date: Tue, 26 May 2026 22:52:37 -0700
Message-Id: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKWGFmoC/yXM0QrCMAxA0V8ZeTYwIwvMXxEZs0u7TJ3S1CKM/
 bt1ezwP9y5gElUMztUCUbKavuYCOlTgxn4OgjoUA9XEdUOM9/zEIKmLErqHWsJM6Ft/4paPvWM
 HpXxH8frdrpfrbvvcJnHpv4J1/QGZJyUldwAAAA==
X-Change-ID: 20260526-kvm-get_reg_list-v2-f9f36961ac6c
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779861178; l=2226;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=XMtEi6pQMVKyTapHo789HRwMSCgn+nOLhMBYdeAM8y0=;
 b=q9jHCAP+KqxybvqnOUcDDbHtKLZ/DyBnHqPDhCTTTHt2gInjOqDb2P9hcABX5fwKgdtCTdq6y
 lOkHTWnkjR3D/UYR6VGzjLbXF8gXsDCK4xZKDIJx7fbtiqW5wHBuyAj
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_225302_844609_C3C3FDA5 
X-CRM114-Status: UNSURE (   7.38  )
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

VGhpcyBzZXJpZXMgYWRkcmVzc2VzIGEgYnVnIGluIHRoZSBTQkkgRldGVCAoRmlybXdhcmUgRmVh
dHVyZXMpIGV4dGVuc2lvbgp3aGVyZSBmZWF0dXJlcyBjb3VsZCByZW1haW4gZXhwb3NlZCB0byBn
dWVzdHMgYWZ0ZXIgdGhlaXIgZGVwZW5kZW50IElTQQpleHRlbnNpb25zIGFyZSBkaXNhYmxlZCBh
dCBydW50aW1lLCBhbmQgaW1wcm92ZXMgdGhlIHJlbGF0ZWQgc2VsZnRlc3QKaW5mcmFzdHJ1Y3R1
cmUuCgpUaGUgYnVnIChwYXRjaCAxKSBvY2N1cnJlZCBiZWNhdXNlIEZXRlQgZmVhdHVyZSBzdXBw
b3J0IHdhcyBjYWNoZWQgYXQgdkNQVQppbml0aWFsaXphdGlvbiB0aW1lLiBXaGVuIHVzZXJzcGFj
ZSBzdWJzZXF1ZW50bHkgZGlzYWJsZWQgSVNBIGV4dGVuc2lvbnMKdmlhIEtWTSBPTkVfUkVHLCB0
aGUgY2FjaGVkIHN1cHBvcnQgc3RhdHVzIHdhcyBub3QgdXBkYXRlZCwgbGVhZGluZyB0bwpzdGFs
ZSBmZWF0dXJlIGV4cG9zdXJlLgoKVGhlIHNlbGZ0ZXN0IGltcHJvdmVtZW50cyAocGF0Y2hlcyAy
LTMpIGVuaGFuY2UgdGhlIGdldC1yZWctbGlzdCB0ZXN0IGJ5CnJlZmFjdG9yaW5nIHRoZSBleHRl
bnNpb24gc3VibGlzdCBpbmZyYXN0cnVjdHVyZSBhbmQgc3BsaXR0aW5nIEZXRlQKZmVhdHVyZSB0
ZXN0aW5nIGludG8gc2VwYXJhdGUsIHByb3Blcmx5LWdhdGVkIHN1Ymxpc3RzLgoKLS0tCkNoYW5n
ZXMgaW4gdjI6Ci0gRml4IEZXRlQgc3RhbGUgZmVhdHVyZSBleHBvc3VyZSBieSByZW1vdmluZyBz
dGF0aWMgJ3N1cHBvcnRlZCcgZmllbGQKLSBSZWZhY3RvciBnZXQtcmVnLWxpc3QgdGVzdCB0byB1
c2UgdW5pZmllZCBleHRlbnNpb24gc3VibGlzdCBtYWNyb3MKLSBTcGxpdCBGV0ZUIHRlc3Rpbmcg
aW50byBwZXItZmVhdHVyZSBzdWJsaXN0cyB3aXRoIHJ1bnRpbWUgY2hlY2tzCihBbmRyZXcpCgpU
bzogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KVG86IEF0aXNoIFBhdHJhIDxhdGlz
aC5wYXRyYUBsaW51eC5kZXY+ClRvOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9yZz4KVG86
IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+ClRvOiBBbGJlcnQgT3UgPGFvdUBl
ZWNzLmJlcmtlbGV5LmVkdT4KVG86IEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KVG86
IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KVG86IEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+ClRvOiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRo
YXQuY29tPgpUbzogU2h1YWggS2hhbiA8c2h1YWhAa2VybmVsLm9yZz4KQ2M6IGdyZWVudGltZS5o
dUBzaWZpdmUuY29tCkNjOiB2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbQpDYzogem9uZy5saUBzaWZp
dmUuY29tCkNjOiBrdm1Admdlci5rZXJuZWwub3JnCkNjOiBrdm0tcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta3NlbGZ0ZXN0QHZnZXIua2VybmVsLm9yZwoK
LS0tCllvbmctWHVhbiBXYW5nICgzKToKICAgICAgS1ZNOiBSSVNDLVY6IFNCSSBGV0ZUOiBGaXgg
c3RhbGUgZmVhdHVyZSBleHBvc3VyZSBhZnRlciBydW50aW1lIGV4dGVuc2lvbiBjaGFuZ2VzCiAg
ICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogUmVmYWN0b3IgSVNBIGFuZCBTQkkgZXh0ZW5zaW9u
IHN1Ymxpc3QgbWFjcm9zCiAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogU3BsaXQgU0JJIEZX
RlQgaW50byBzZXBhcmF0ZSBmZWF0dXJlLXNwZWNpZmljIHN1Ymxpc3RzCgogYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9rdm1fdmNwdV9zYmlfZndmdC5oICAgICAgIHwgICAxIC0KIGFyY2gvcmlzY3Yv
a3ZtL3ZjcHVfc2JpX2Z3ZnQuYyAgICAgICAgICAgICAgICAgICB8ICAxNyArKy0KIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDE3MiArKysrKysrKysr
KysrKystLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAxMTkgaW5zZXJ0aW9ucygrKSwgNzEgZGVs
ZXRpb25zKC0pCi0tLQpiYXNlLWNvbW1pdDogYzc4MzI1MzRhODE2MDI3NmNjY2I5YThjYzhjYWZi
NTYxNGM1NzlkMApjaGFuZ2UtaWQ6IDIwMjYwNTI2LWt2bS1nZXRfcmVnX2xpc3QtdjItZjlmMzY5
NjFhYzZjCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
