From: David Hildenbrand <david@redhat.com>
Date: Mon, 8 Apr 2024 09:36:37 +0200
Subject: [PATCH 4/4] mm: replace set_pte_at_notify() with just
 set_pte_at()
In-Reply-To: <20240405115815.3226315-5-pbonzini@redhat.com>
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-5-pbonzini@redhat.com>
Message-ID: <fb525c6b-4284-4cb2-b3e1-20275fc3c4f3@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 05.04.24 13:58, Paolo Bonzini wrote:
> With the demise of the .change_pte() MMU notifier callback, there is no
> notification happening in set_pte_at_notify().  It is a synonym of
> set_pte_at() and can be replaced with it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

A real joy seeing that gone

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


