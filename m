Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDB5C3ABC9
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 May 2025 08:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjDqgbdAQoVylleX7GjlLi7xPBnB8gZs9FaN61KejIQ=; b=f8iqsVGBYrv4sq
	xV4hseEfnfDpve+5Cvl2IPvZ09nHJdRYsnrYNxeB2JpCWCAWEy8EioGG1wPEM3V97GWExR4VkE+PV
	C5w4ELC/P8GPle3NDs1U0YYhIL1QnTxxjj9zsOHsJsRPJejTdo8urahc3bmzfIW9EbvAaWKbGxHFj
	690Q1IHVtkuvZMhd3U1qv6PzCVTsrvdyAjZCqPICbxvNNNSSoz4Fc+5HB6SfC1qVgxLa3TMYDyURI
	T+SwrDtJqaOFAFUoiLJHtaNrytzSTNKgiXBxmDSpLaZK2xXqR0k/rg2aAzNPuHIZ+ad8Ohbjzoe+w
	NHyFAQTdKfkKvESxn5qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTyC-0000000HXi3-1zMX;
	Thu, 15 May 2025 08:29:36 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTsb-0000000HVgp-0QQh
	for kvm-riscv@lists.infradead.org;
	Thu, 15 May 2025 08:23:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13453625e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 15 May 2025 01:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747297427; x=1747902227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=jf5Ty01kjdHR2w+uxYcekV/AldVuaCBKJElSN/DXBZlqdd30DWhP89Rp4gEGl40jaP
         W6YWwaz84bJFv1YFSoLeR1EANEh+wrC8bb3PDtHQR/oofJUvQT/A/W2X4mJeUDOdOlbE
         kvKlMxP9iKAcBO6vJ71V8rWDE0hFGOgyBmsMudoAOWY22B54q46S/LGqQ7ifmUZ+lOdf
         WrATWv6HJuJd3BHeZ8f8ur9Q/ER+6BoG3hFkVApJCAhdoAqZNXGFCsTgqJfFmuhYZqfL
         ZISNRC8TluT/ebhyCh+FOYV43qPnFyWXWXcFFhc5Kqaaoj2Tf4Cf0Lu2cMrLVm58O679
         SKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747297427; x=1747902227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z13A9Xmh4hlNXDYVsXBjasLvO/5IjxZE5WiJJRlkS1s=;
        b=J9OGY7raUeitsNtJuPiED68FSxW1J6sCYiRCwKeNaQcwQ9J7gw3D0wq2Zo73GIBMwB
         V5vl53nb3yr7aFhHtSo3JU6LF39dZilUkI2oJcsDiJB3XVpBNwop9Vh3y+/SWqEYPYSf
         dmzvWaCTb9VmJmryq1iWSD7J1k+SVhEbmFU9aPO0hVcp6pYjvkWDjq/mW5h5vueqom71
         3BxDErqMhV/2qa+XVNTsdF85SINgjH6MQmnHxXK2gVC7uuJFv1trzkymlcEpQQ8midoU
         bv0+747zIn6eh/tAgurPDBC9zuBhULhqppQpJb0oVhj+QKmd0p48T1/aggWobC3WUyO2
         RqDw==
X-Forwarded-Encrypted: i=1; AJvYcCVNpZ0ECuQz2t3aT/RCEXdoQVeP/+Qvy0vdUco+98FxRjdyk6jgnOH7ZqebqiPSB2cpum/taLq9lwA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBaQHVBfUgjKYdfzuO5HT72f9d5LvtWEdCcfGmYU3FTthxDKKB
	23ajh5MWB3KwuCy+dOlYNnmUAsYAZY97L33n3XNknFODkJUD2GcfC//vzjRD1oQ=
X-Gm-Gg: ASbGnctZngua3u6zI8Y5QzF4F2N9ShhQm9FhxIoCK7pf5irJdbbOa3tBBEMS2qME5+p
	82pjM6e8uySGHQM6EfsY97NjwdcREwdCeOQvFYY3ykuWF/Q5ZKsnnRbyBAAEzWKp4d4oKmLfU3Z
	ulb3HzwmRBSU+M+a2k+2z+DBVtrALhtRsIQAewf/Ls1tWbywte3dXE6V3qdxFs6bps33ar099l+
	Jw2iUppmxOh5N0yv5SYeBQET8HjdlMz1l8xIL1LQNZRSDiG5HPAqoiyKD9PT1mXVresgAV6fy7b
	deOmixSh4w0ghwVGWnXvxoNFpYN617KeU4rH0Dt6xVSACzAhmHs=
X-Google-Smtp-Source: AGHT+IHkZNQbpAw1wphnseKXwk4yMRcZGss2iiWcC12RxGFa4TAsYttDPas1NVsjc2nqofvNADAfDw==
X-Received: by 2002:a05:600c:828e:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-442f850c4f5mr24840985e9.13.1747297427334;
        Thu, 15 May 2025 01:23:47 -0700 (PDT)
Received: from carbon-x1.. ([91.197.138.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f395166fsm59310785e9.18.2025.05.15.01.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:23:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v7 03/14] riscv: sbi: add new SBI error mappings
Date: Thu, 15 May 2025 10:22:04 +0200
Message-ID: <20250515082217.433227-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515082217.433227-1-cleger@rivosinc.com>
References: <20250515082217.433227-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012349_130484_06F965CF 
X-CRM114-Status: UNSURE (   7.85  )
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

QSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFwcyB0aGVt
IGFzIGNsb3NlIGFzCnBvc3NpYmxlIHRvIGVycm5vIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+ClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8
YXRpc2hwQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIHwg
MTAgKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaAppbmRleCBiYjA3N2QwYzkxMmYuLjA5MzhmMmE4ZDAxYiAxMDA2NDQKLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaAorKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Ni
aS5oCkBAIC01MzYsMTEgKzUzNiwyMSBAQCBzdGF0aWMgaW5saW5lIGludCBzYmlfZXJyX21hcF9s
aW51eF9lcnJubyhpbnQgZXJyKQogCWNhc2UgU0JJX1NVQ0NFU1M6CiAJCXJldHVybiAwOwogCWNh
c2UgU0JJX0VSUl9ERU5JRUQ6CisJY2FzZSBTQklfRVJSX0RFTklFRF9MT0NLRUQ6CiAJCXJldHVy
biAtRVBFUk07CiAJY2FzZSBTQklfRVJSX0lOVkFMSURfUEFSQU06CisJY2FzZSBTQklfRVJSX0lO
VkFMSURfU1RBVEU6CiAJCXJldHVybiAtRUlOVkFMOworCWNhc2UgU0JJX0VSUl9CQURfUkFOR0U6
CisJCXJldHVybiAtRVJBTkdFOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX0FERFJFU1M6CiAJCXJl
dHVybiAtRUZBVUxUOworCWNhc2UgU0JJX0VSUl9OT19TSE1FTToKKwkJcmV0dXJuIC1FTk9NRU07
CisJY2FzZSBTQklfRVJSX1RJTUVPVVQ6CisJCXJldHVybiAtRVRJTUVET1VUOworCWNhc2UgU0JJ
X0VSUl9JTzoKKwkJcmV0dXJuIC1FSU87CiAJY2FzZSBTQklfRVJSX05PVF9TVVBQT1JURUQ6CiAJ
Y2FzZSBTQklfRVJSX0ZBSUxVUkU6CiAJZGVmYXVsdDoKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlz
Y3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
